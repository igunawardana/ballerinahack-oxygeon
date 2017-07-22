package oxygeon.core;

import ballerina.lang.system;
import ballerina.lang.jsons;
import ballerina.net.http;

function getUsers() (json) {
    system:println("Returning users");
    http:ClientConnector frequencyService = create http:ClientConnector("http://localhost:9092/db");
    message request = {};
    message response = http:ClientConnector.post(frequencyService, "/frequency/info", request);
    system:println(response);
    json users;
    users = {
        	"users": [{
        		"user": {
        			"mobile-no": "+94772265747",
        			"news-articles": [{
        				"uri": "http://www.bbc.co.uk/news/world-middle-east-40685369"
        			}]
        		}
        	}]
        };
        
    return users;
}

function persistNews(json newsArticles) (boolean) {
    system:println("Writing only new news to db\nNews content: " + jsons:toString(newsArticles));
    return true;
}