package oxygeon.news;

import ballerina.lang.system;
import ballerina.net.http;
import ballerina.lang.messages;


function getNews(string source,string category) (json) {

    message m = {};
    http:ClientConnector newsEP = create http:ClientConnector(
                                  "http://newsapi.org/v1/");

    message response = {};
    string apiKey="7d1a31375cd84e8480732fc9f9b904cd";
    string requestPath  = "/sources?category="+category+"&source="+source+"sortBy=latest&apiKey="+apiKey;

    response = http:ClientConnector.get(newsEP,requestPath, m);

    json newsObject = messages:getJsonPayload(response);

    system:println(newsObject);
    return newsObject;
}
