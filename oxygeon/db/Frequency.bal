package oxygeon.db;

import ballerina.net.http;
import ballerina.data.sql;


@http:configuration{basePath:"/db"}
service<http> CustomerMgtService {

    @http:POST{}
    @http:Path {value:"/frequency"}
    resource insertFrequency(message m) {
        sql:ClientConnector dbConnector = createDbConnection();
        sql:Parameter mobileNo = {sqlType:"integer",value:"0779303127"};
        sql:Parameter catId = {sqlType:"varchar",value:"1"};
        sql:Parameter timeFrequency = {sqlType:"float",value:"0.25"};
        sql:Parameter[] params = [mobileNo, catId, timeFrequency];
        
        closeDbConnection(dbConnector);
        message response = {};
        reply response;
    }
}