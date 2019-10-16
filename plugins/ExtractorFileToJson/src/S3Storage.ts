import * as AWS from "aws-sdk";
import * as fs from "fs";
import * as os from "os";
import * as path from "path";
import { IRufusLogger } from "rufus";
import * as uuidv4 from "uuidv4";
import { IFile, IPluginParams } from "./ExtractorFileToJson.types";
export class S3Storage {
    private clients: AWS.S3;
    private params: IPluginParams;
    private logger: IRufusLogger;
    private UPLOAD_DIR: string = process.env.GATE_UPLOAD_DIR || os.tmpdir();
    constructor(params: IPluginParams, logger: IRufusLogger) {
        const credentials = new AWS.Credentials({
            accessKeyId: this.params.cvS3KeyId,
            secretAccessKey: this.params.cvS3SecretKey,
        });
        if (this.params.cvTypeStorage === "riak") {
            const endpoint = new AWS.Endpoint("http://s3.amazonaws.com");
            const config = {
                apiVersion: "2006-03-01",
                credentials,
                endpoint,
                httpOptions: {
                    proxy: this.params.cvPath,
                },
                region: "us-east-1",
                s3DisableBodySigning: true,
                s3ForcePathStyle: true,
                signatureVersion: "v2",
                sslEnabled: false,
            };
            this.clients = new AWS.S3(new AWS.Config(config));
        } else {
            const endpoint = new AWS.Endpoint(this.params.cvPath);
            const config = {
                credentials,
                endpoint,
            };
            this.clients = new AWS.S3(new AWS.Config(config));
        }
    }

    /**
     * Сохраняем в S3 хранилище
     * @param gateContext
     * @param json
     * @param val
     * @param query
     * @returns file
     */
    public saveFile(
        key: string,
        buffer: any,
        content: string,
        Metadata?: AWS.S3.Metadata,
        size: number = Buffer.byteLength(buffer),
    ): Promise<void> {
        return new Promise((resolve, reject) => {
            this.clients.putObject(
                {
                    ...(this.params.clS3ReadPublic
                        ? { ACL: "public-read" }
                        : {}),
                    Body: buffer,
                    Bucket: this.params.cvS3Bucket,
                    ContentLength: size,
                    ContentType: content,
                    Key: key,
                    Metadata,
                },
                (err) => {
                    if (err) {
                        return reject(err);
                    }
                    resolve();
                },
            );
        });
    }
    public deletePath(key: string): Promise<void> {
        return new Promise((resolve, reject) => {
            this.clients.headObject(
                {
                    Bucket: this.params.cvS3Bucket,
                    Key: key,
                },
                (er) => {
                    if (er) {
                        this.logger.debug(er);
                        return resolve();
                    }
                    this.clients.deleteObject(
                        {
                            Bucket: this.params.cvS3Bucket,
                            Key: key,
                        },
                        (err) => {
                            if (err) {
                                return reject(err);
                            }
                            return resolve();
                        },
                    );
                },
            );
        });
    }

    public getFile(key: string): Promise<IFile> {
        return new Promise((resolve, reject) => {
            this.clients.getObject(
                {
                    Bucket: this.params.cvBucket,
                    Key: key,
                },
                (err, response) => {
                    if (err) {
                        return reject(err);
                    }
                    const filePath = path.join(this.UPLOAD_DIR, uuidv4());
                    fs.writeFile(filePath, response.Body, (er) => {
                        if (er) {
                            return reject(er);
                        }
                        resolve({
                            fieldName: "upload",
                            headers: {
                                "content-type": response.ContentType,
                            },
                            originalFilename:
                                response.Metadata &&
                                response.Metadata.originalFilename,
                            path: filePath,
                            size: response.ContentLength,
                        });
                    });
                },
            );
        });
    }
}
