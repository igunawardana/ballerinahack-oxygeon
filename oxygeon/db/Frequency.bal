package oxygeon.db;

import ballerina.net.http;
import ballerina.data.sql;
import ballerina.lang.messages;
import ballerina.lang.jsons;
import ballerina.lang.errors;

@http:configuration{basePath:"/db", port: 9092}
service<http> FrequencyTableService {
    
    @http:GET{}
    @http:Path {value:"/frequency"}
    resource getFrequency(message m) {
        map dbProperties = {"jdbcUrl":"jdbc:mysql://localhost:3306/oxygeon","username":"root","password":""};
        sql:ClientConnector dbConnector = create sql:ClientConnector(dbProperties);
        string query = "Select * from frequency";
        message response = {};
        try {
            sql:Parameter[] params = [];
            datatable dt = sql:ClientConnector.select(dbConnector, query, params);
            var payload, err = <json>dt;
            if (err != null) {
                messages:setJsonPayload(response, payload);
            } else {
                throw err;
            }
        } catch(errors:Error er) {
            throw er;
        }
        reply response;
    }
    
    @http:GET{}
    @http:Path {value:"/frequency/info"}
    resource getFrequencyDetails(message m) {
        map dbProperties = {"jdbcUrl":"jdbc:mysql://localhost:3306/oxygeon","username":"root","password":""};
        sql:ClientConnector dbConnector = create sql:ClientConnector(dbProperties);
        string query = "Select f.mobileno, m.uri from frequency f, meta m where f.catid=m.catid order by f.mobileno asc";
        message response = {};
        try {
            sql:Parameter[] params = [];
            datatable dt = sql:ClientConnector.select(dbConnector, query, params);
            var payload, err = <json>dt;
            if (err != null) {
                messages:setJsonPayload(response, payload);
            } else {
                throw err;
            }
        } catch(errors:Error er) {
            throw er;
        }
        reply response;
    }

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

    @http:POST{}
    @http:Path {value:"/users"}
    resource insertUpdate(message m) {

        json payload = messages:getJsonPayload(m);

        int user = 0;
        int mobile = jsons:getInt(payload, "$.mobileNo");
        string categoryId = jsons:getString(payload, "$.category");
        float time = jsons:getFloat(payload, "$.frequency");


        sql:Parameter userId = {sqlType:"integer",value:user};
        sql:Parameter mobileNo = {sqlType:"integer",value:mobile};
        sql:Parameter catId = {sqlType:"varchar",value:categoryId};
        sql:Parameter timeFrequency = {sqlType:"float",value:time};

        sql:Parameter[] params = [userId, mobileNo, catId, timeFrequency];

        message response = {};

        string query = "Insert into user values (?,?,?,?)";
        map dbProperties = {"jdbcUrl":"jdbc:mysql://localhost:3306/oxygeon","username":"root","password":"password"};
        sql:ClientConnector dbConnector = create sql:ClientConnector(dbProperties);
        try {
            sql:ClientConnector.update(dbConnector, query, params);
            response =  {"response":"Success"};
        } catch(errors:Error er) {
            response =  {"response":"fail"};
            throw er;
        }
        sql:ClientConnector.close(dbConnector);

        reply response;
    }
}