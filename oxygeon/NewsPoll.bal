import ballerina.lang.system;
import ballerina.net.http;

function main (string[] args) {
    system:println("Hello, World!");
    getNews("cnn","business");

}

function getNews(string source,string category) {

    message m = {};
    http:ClientConnector newsEP = create http:ClientConnector(
                                  "https://newsapi.org/v1/");

    message response = {};
    string apiKey="7d1a31375cd84e8480732fc9f9b904cd";
    string requestPath  = "/sources?category="+category+"&source="+source+"sortBy=top&apiKey="+apiKey;

    response = http:ClientConnector.get(newsEP,requestPath, m);

    //json test = messages:getJsonPayload(response);
    //json test = jsons:getJson(response, "$");
    system:println(response);
    //reply response;
}
