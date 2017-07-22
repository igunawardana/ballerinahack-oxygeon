package oxygeon.core;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.utils.logger;

function updateLatestNews()(boolean){


    string[] sources = [];
    string[] categories = [];

    sources = ["cnn", "bbc"];
    categories = ["business","entertainment","sport"];

    int i = 0 ;
    int j = 0;
    boolean dbOperation;

    logger:info("Updating news start");
    while(i <  sources.length ){
        j = 0;
        while(j <  categories.length ){
            logger:debug("Updating news on source "+sources[i]+"category"+categories[j]);
            dbOperation = persistNews(getNews(sources[i],categories[j]));
            if(dbOperation){
                logger:debug("DB updating success");
                j = j + 1;
                continue;
            }else{
                logger:debug("DB updating fail");
                break;
            }

        }
        i = i + 1;
    }

    return dbOperation;

}

function getNews(string source,string category) (json) {

    message m = {};
    http:ClientConnector newsEP = create http:ClientConnector(
                                  "http://newsapi.org/v1/");

    message response = {};
    string apiKey="7d1a31375cd84e8480732fc9f9b904cd";
    string requestPath  = "/sources?category="+category+"&source="+source+"sortBy=latest&apiKey="+apiKey;

    response = http:ClientConnector.get(newsEP,requestPath, m);

    json newsObject = messages:getJsonPayload(response);

    logger:info("News article found");
    return newsObject;
}