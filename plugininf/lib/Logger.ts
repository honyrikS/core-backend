/**
 * Created by artemov_i on 06.12.2018.
 */
import * as fs from "fs";
import * as path from "path";
import * as rufus from "rufus";
import IGlobalObject from "./IGlobalObject";

const re = /"level":\s*"([^"]+)"/gi;

const pathConf =
    process.env.LOGGER_CONF ||
    path.join(
        (global as any as IGlobalObject).homedir || __dirname,
        "resources",
        "config",
        "logger.json",
    );

class Logger {
    public static loadConfig(): void {
        if (fs.existsSync(pathConf)) {
            fs.readFile(
                pathConf,
                {
                    encoding: "utf8",
                    flag: "r",
                },
                (err, strConf) => {
                    if (err) {
                        // tslint:disable-next-line:no-console
                        console.error(
                            "Ошибка инициализации настроек логера",
                            err,
                        );
                    }
                    let findLevel = re.exec(strConf);
                    while (findLevel !== null) {
                        strConf = strConf.replace(
                            `"${findLevel[1]}"`,
                            rufus[findLevel[1].toUpperCase()],
                        );
                        findLevel = re.exec(strConf);
                    }
                    // tslint:disable-next-line:no-console
                    console.log("Load config logger", strConf);
                    const json = JSON.parse(strConf);
                    rufus._handlers.length = 0;
                    rufus.config(json);
                },
            );
        } else {
            rufus._handlers.length = 0;
            rufus.config({
                handlers: {
                    console: {
                        class: "rufus/handlers/console",
                    },
                },
                loggers: {
                    root: {
                        handlers: ["console"],
                        level: "INFO",
                    },
                },
            });
        }
    }

    public static getRootLogger(): rufus.IRufusLogger {
        return rufus;
    }

    public static getLogger(str: string): rufus.IRufusLogger {
        const logger = rufus.getLogger(str);
        logger.isDebugEnabled = () => logger.isEnabledFor(rufus.DEBUG);
        logger.isTraceEnabled = () => logger.isEnabledFor(rufus.VERBOSE);
        logger.isWarnEnabled = () => logger.isEnabledFor(rufus.WARNING);
        logger.isInfoEnabled = () => logger.isEnabledFor(rufus.INFO);
        logger.child = (...args) => logger.verbose(args);
        return logger as rufus.IRufusLogger;
    }
}
if (fs.existsSync(pathConf)) {
    fs.watch(pathConf, Logger.loadConfig);
}
Logger.loadConfig();
Logger.getLogger("Logger").info("Init Logger");

export default Logger;
