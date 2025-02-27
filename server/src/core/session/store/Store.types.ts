import { SessionData } from "express-session";
import { ISessionData } from "@ungate/plugininf/lib/ISession";

export interface IStoreTypes {
    nameContext: string;
    ttl: number;
}

export type IGateSession = SessionData & {
    [key: string]: any;
    gsession: ISessionData;
};
