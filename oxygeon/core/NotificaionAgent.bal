package oxygeon.core;

import ballerina.lang.system;

function notifyUser(){
    system:println("getting users list");
    json users = getUsers();
    // http:ClientConnector frequencyService = create http:ClientConnector("http://localhost:9092/db");
    // message request = {};
    // message response = http:ClientConnector.post(frequencyService, "/frequency/info", request);
    //system:println(response);
}

function abc(){
    
    
    
}