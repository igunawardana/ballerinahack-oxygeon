package oxygeon.db;

import ballerina.data.sql;
import ballerina.lang.system;

function createDbConnection()(sql:ClientConnector dbConnector) {
    map dbProperties = {"jdbcUrl":"jdbc:mysql://localhost:3306/oxygeon?useSSL=false","username":"root","password":""};
    dbConnector = create sql:ClientConnector(dbProperties);
    return dbConnector;
}

function closeDbConnection(sql:ClientConnector dbConnector) {
    sql:ClientConnector.close(dbConnector);
}