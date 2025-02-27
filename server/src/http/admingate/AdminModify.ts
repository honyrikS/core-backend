import ILocalDB from "@ungate/plugininf/lib/db/local/ILocalDB";
import BreakException from "@ungate/plugininf/lib/errors/BreakException";
import ErrorException from "@ungate/plugininf/lib/errors/ErrorException";
import ErrorGate from "@ungate/plugininf/lib/errors/ErrorGate";
import ICCTParams, { IParamsInfo } from "@ungate/plugininf/lib/ICCTParams";
import IContext from "@ungate/plugininf/lib/IContext";
import IObjectParam from "@ungate/plugininf/lib/IObjectParam";
import { IGateQuery } from "@ungate/plugininf/lib/IQuery";
import ResultStream from "@ungate/plugininf/lib/stream/ResultStream";
import { encryptPassword, isEmpty } from "@ungate/plugininf/lib/util/Util";
import { forEach, isObject } from "lodash";
import Property from "../../core/property/index";
import RiakAction from "./RiakAction";
import PluginManager from "../../core/pluginmanager/index";
import IContextConfig from "../../core/property/IContextConfig";
import IEventConfig from "../../core/property/IEventConfig";
import IProviderConfig from "../../core/property/IProviderConfig";
import IShedulerConfig from "../../core/property/IShedulerConfig";
import IPluginConfig from "../../core/property/IPluginConfig";

const actions = ["i", "u", "d"];

interface IModifyDb {
    db: ILocalDB<any>;
    getParamsInfo?: (data: any) => IParamsInfo;
}
export default class AdminModify {
    public params: ICCTParams;
    public name: string;
    public riakAction: RiakAction;
    modify: Record<string, IModifyDb> = {};
    constructor(name: string, params: ICCTParams) {
        this.name = name;
        this.params = params;
        this.riakAction = new RiakAction(params);
    }

    public async init(): Promise<void> {
        this.modify.dbContexts = {
            db: await Property.getContext(),
            getParamsInfo: (data: IContextConfig) => {
                return PluginManager.getGateContextClass(
                    data.ck_d_plugin,
                ).getParamsInfo();
            },
        };
        this.modify.dbEvents = {
            db: await Property.getEvents(),
            getParamsInfo: (data: IEventConfig) => {
                return PluginManager.getGateEventsClass(
                    data.ck_d_plugin,
                ).getParamsInfo();
            },
        };
        this.modify.dbProviders = {
            db: await Property.getProviders(),
            getParamsInfo: (data: IProviderConfig) => {
                return PluginManager.getGateProviderClass(
                    data.ck_d_plugin,
                ).getParamsInfo();
            },
        };
        this.modify.dbSchedulers = {
            db: await Property.getSchedulers(),
            getParamsInfo: (data: IShedulerConfig) => {
                return PluginManager.getGateSchedulerClass(
                    data.ck_d_plugin,
                ).getParamsInfo();
            },
        };
        this.modify.dbPlugins = {
            db: await Property.getPlugins(),
            getParamsInfo: (data: IPluginConfig) => {
                return PluginManager.getGatePluginsClass(
                    data.ck_d_plugin,
                ).getParamsInfo();
            },
        };
        this.modify.dbQuerys = {
            db: await Property.getQuery(),
        };
        this.modify.dbServers = {
            db: await Property.getServers(),
        };
    }

    public async checkModify(
        gateContext: IContext,
        query: IGateQuery,
    ): Promise<IObjectParam[]> {
        if (isEmpty(query.inParams.json) || isEmpty(query.queryStr)) {
            gateContext.warn(
                `Require params isEmpty:\njson: ${query.inParams.json}\nqueryStr: ${query.queryStr}`,
            );
            throw new ErrorException(ErrorGate.JSON_PARSE);
        }
        const json = JSON.parse(query.inParams.json, (key, value) => {
            if (value === null) {
                return undefined;
            }
            return value;
        });
        if (this.riakAction[query.queryStr]) {
            return this.riakAction[query.queryStr](gateContext, json);
        }
        if (actions.includes(json.service.cv_action.toLowerCase())) {
            const localDb = this.modify[query.queryStr];
            if (isEmpty(localDb)) {
                gateContext.warn(`LocalDb not found: ${query.queryStr}`);
                throw new ErrorException(ErrorGate.JSON_PARSE);
            }
            if (
                query.queryStr === "dbPlugins" &&
                json.service.cv_action.toLowerCase() === "i"
            ) {
                json.data.ck_id = `${json.data.cv_name}:${json.data.ck_d_provider}`;
            }
            return this.callLocalDb(localDb, json) as any;
        }

        return [];
    }

    deepChange(res, data, conf: IParamsInfo, keyPrefix) {
        forEach(data, (val, key) => {
            const confChild = Array.isArray(data) ? conf : conf?.[key];
            if (isObject(val) || Array.isArray(val)) {
                this.deepChange(
                    res,
                    val,
                    (conf?.[key] as any)?.childs,
                    `${keyPrefix}.${key}`,
                );
            } else if (confChild && confChild.type === "password") {
                if (
                    val !==
                    "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
                ) {
                    res[`${keyPrefix}.${key}`] = encryptPassword(val);
                }
            } else if (
                val !==
                "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
            ) {
                res[`${keyPrefix}.${key}`] = val;
            }
        });
    }

    deepPassword(data, conf: IParamsInfo) {
        forEach(data, (val, key) => {
            const confChild = Array.isArray(data) ? conf : conf?.[key];
            if (isObject(val) || Array.isArray(val)) {
                this.deepPassword(val, (conf?.[key] as any)?.childs);
            } else if (confChild && confChild.type === "password") {
                if (
                    val !==
                    "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
                ) {
                    data[key] = encryptPassword(val);
                }
            }
        });
    }

    private async callLocalDb(
        { db, getParamsInfo }: IModifyDb,
        json: IObjectParam,
    ) {
        delete json.data.cv_params;
        switch (json.service.cv_action.toLowerCase()) {
            case "i": {
                if (getParamsInfo || json.data.cct_params) {
                    this.deepPassword(
                        json.data.cct_params,
                        getParamsInfo(json.data),
                    );
                }
                return db.insert(json.data).then(async () => {
                    await (db as any).compactDatafile();
                    return [
                        {
                            ck_id: json.data.ck_id,
                            cv_error: null,
                        },
                    ];
                });
            }
            case "u": {
                const ckId = json.data.ck_id;
                if (getParamsInfo || json.data.cct_params) {
                    this.deepChange(
                        json.data,
                        json.data.cct_params,
                        getParamsInfo(json.data),
                        "cct_params",
                    );
                    delete json.data.cct_params;
                }
                const rec = await db.findOne(
                    {
                        ck_id: ckId,
                    },
                    true,
                );
                if (!rec) {
                    throw new BreakException({
                        data: ResultStream([
                            {
                                ck_id: "",
                                cv_error: {
                                    519: [],
                                },
                            },
                        ]),
                        type: "success",
                    });
                }
                return db
                    .update(
                        {
                            ck_id: ckId,
                        },
                        {
                            $set: json.data,
                        },
                    )
                    .then(async () => {
                        await (db as any).compactDatafile();
                        return [
                            {
                                ck_id: ckId,
                                cv_error: null,
                            },
                        ];
                    });
            }
            case "d": {
                return db
                    .remove({
                        ck_id: json.data.ck_id,
                    })
                    .then(async () => {
                        await (db as any).compactDatafile();
                        return [
                            {
                                ck_id: json.data.ck_id,
                                cv_error: null,
                            },
                        ];
                    });
            }
            default:
                return Promise.reject(
                    new ErrorException(-1, "Нет такого обработчика"),
                );
        }
    }
}
