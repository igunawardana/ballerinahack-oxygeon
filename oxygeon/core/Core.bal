package oxygeon.core;

import ballerina.lang.system;
import ballerina.lang.jsons;

function main (string[] args) {
    
    int i = 100;
    json updateResult = {};
    
    system:println("Updating news...");
    
    i -> wNewsUpdater;
    updateResult <- wNewsUpdater;
    
    system:println("News updated." + jsons:toString(updateResult));
    
    boolean isUpdated = true;
    
    json notificationResult = {};
    int k;
    json sendResult={"status":"success"};
    
    if(isUpdated){
        system:println("Sending updated news...");
        k = 0;
        k -> wNewsSender;
        sendResult <- wNewsSender;
    }
   
    system:println("News sent." + jsons:toString(sendResult));
     
    worker wNewsUpdater {
        int iw;
        iw <- default;
        json response = {"name":"Updates"};
        response -> default;
    }
    
    worker wNewsSender {
        int wnsA = 0;
        wnsA <- default;
        json response = {"name":"News"};
        system:println("Notified the users");
        response -> default;
    }
    
}
