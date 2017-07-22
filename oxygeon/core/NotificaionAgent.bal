package oxygeon.core;

import ballerina.lang.system;
import ballerina.net.http;

function notifyUser(){
    system:println("getting users list");
    http:ClientConnector frequencyService = create http:ClientConnector("http://localhost:9090/db");
    message request = {};
    message response = http:ClientConnector.post(frequencyService, "/frequency/info", request);
    system:println(response);
}

function abc(){
    
    
    
}