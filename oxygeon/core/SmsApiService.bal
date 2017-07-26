package oxygeon.core;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.system;

function sendSMS(string mobileNumber,string newsContent) (json) {

    http:ClientConnector SMSEP = create http:ClientConnector("https://10.10.10.77:8243/services/ShoutoutProxy");

    message request = {};

    json payload = {"source": "ShoutDEMO","destinations": [mobileNumber],"transports": ["sms"],"content": {"sms": newsContent}};

    messages:setHeader(request,"Content-Type","application/json");
    messages:setHeader(request,"Authorization","Apikey <SMS_API_KEY>");
    messages:setJsonPayload(request,payload);
    message response = {};
            
    response = http:ClientConnector.post(SMSEP,"/v7/messages", request);

    json SMSresponse = messages:getJsonPayload(response);

    system:println(SMSresponse);
    return SMSresponse;
}
