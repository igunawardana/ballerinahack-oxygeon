package db;

import ballerina.net.http;
import ballerina.data.sql;
import ballerina.lang.messages;
import ballerina.lang.jsons;
import ballerina.lang.errors;

@http:configuration{basePath:"/db"}
service<http> CustomerMgtService {

    @http:POST{}
    @http:Path {value:"/frequency"}
    resource insertFrequency(message m) {
        json payload = messages:getJsonPayload(m);
        int mobile = jsons:getInt(payload, "$.mobileNo");
        string categoryId = jsons:getString(payload, "$.catId");
        float time = jsons:getFloat(payload, "$.timeFrequency");
        sql:Parameter mobileNo = {sqlType:"integer",value:mobile};
        sql:Parameter catId = {sqlType:"varchar",value:categoryId};
        sql:Parameter timeFrequency = {sqlType:"float",value:time};
        sql:Parameter[] params = [mobileNo, catId, timeFrequency];
        string query = "Insert into frequency values (?,?,?)";
        map dbProperties = {"jdbcUrl":"jdbc:mysql://localhost:3306/oxygeon","username":"root","password":""};
        sql:ClientConnector dbConnector = create sql:ClientConnector(dbProperties); 
        try {
            sql:ClientConnector.update(dbConnector, query, params);
        } catch(errors:Error er) {
            throw er;
        }
        sql:ClientConnector.close(dbConnector);
        message response = {};
        reply response;
    }
}