package oxygeon.core;

import ballerina.lang.system;
import ballerina.utils.logger;

function main (string[] args) {
    
    logger:info("Looking for latest news");
    
    int k;
    boolean newsSourceUpdated = false;
    
    system:println("Sending updated news...");
    k = 0;
    k -> wNewsUpdator;
    newsSourceUpdated <- wNewsUpdator;
   
   logger:info("News sources updated: " + newsSourceUpdated);
   
   if (newsSourceUpdated) {
       logger:info("Latest news found and notifying users");
       notifyUser();
   }else {
       logger:error("Error occurred in getting latest news");
       return;
   }
     
    worker wNewsUpdator{
        int wk = 0;
        wk <- default;
        logger:info("Updating news...");
        boolean success = false;
        success = updateLatestNews();
        success -> default;
    }
    
}
