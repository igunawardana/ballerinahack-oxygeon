package oxygeon.core;

import ballerina.lang.system;
import ballerina.lang.jsons;


function notifyUser(){
    system:println("getting users list");
    json users = getUsers();
    string mobileNo = jsons:getString(users, "$.users[0].user.mobile-no");
    string uri = jsons:getString(users, "$.users[0].user.news-articles[0].uri");
    sendSMS(mobileNo, uri);
}