package oxygeon.core;

import ballerina.lang.system;

function getUsers() (json) {
    system:println("Returning users");
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
    system:println("Writing only new news to db\nNews content: " + newsArticles);
    return true;
}