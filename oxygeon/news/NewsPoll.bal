
import ballerina.lang.system;
import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.utils.logger;

function main (string[] args){


    string[] sources = [];
    string[] categories = [];

    sources = ["cnn", "bbc"];
    categories = ["business","entertainment","sport"];

    int i = 0 ;
    int j = 0;
    boolean dbOperation;

    logger:info("Updating news start");
    logger:info(sources.length);
    while(i <  sources.length ){
        j = 0;
        while(j <  categories.length ){
            logger:debug("Updating news on source "+sources[i]+"category"+categories[j]);
            getNews(sources[i],categories[j]);
            j = j + 1;
        }

        i = i + 1;
    }

}


function getNews(string source,string category) (json) {

    message m = {};
    http:ClientConnector newsEP = create http:ClientConnector(
                                  "http://newsapi.org/v1/");

    message response = {};
    string apiKey="<NEWS_API_KEY>";
    string requestPath  = "/sources?category="+category+"&source="+source+"sortBy=latest&apiKey="+apiKey;

    response = http:ClientConnector.get(newsEP,requestPath, m);

    json newsObject = messages:getJsonPayload(response);

    system:println(source+":"+category);
    return newsObject;
}
