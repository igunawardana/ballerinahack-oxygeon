import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.system;

@http:configuration {basePath:"/SMSservice"}
service<http> SMSSendingService {
    
    @http:POST {}
    @http:Path {value:"/"}
    resource smsresource (message m) {

        json inJsonMsg = messages:getJsonPayload(m);

        string mobileNumber;
        mobileNumber, _ = (string)inJsonMsg["mobile"];

        string newsContent;
        newsContent, _ = (string)inJsonMsg["newscontent"];

        system:println(mobileNumber);
        system:println(newsContent);

        http:ClientConnector SMSEP = create http:ClientConnector("https://MitraiRandimaS:8243/services/ShoutoutProxy");
        message request = {};

        json payload = {"source": "ShoutDEMO","destinations": [mobileNumber],"transports": ["sms"],"content": {"sms": newsContent}};

        messages:setHeader(request,"Content-Type","application/json");
        messages:setHeader(request,"Authorization","Apikey eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI0YmEyM2U4MC02ZWE2LTExZTctOTU4Zi0yOWNjOTcyZWVjOWIiLCJzdWIiOiJTSE9VVE9VVF9BUElfVVNFUiIsImlhdCI6MTUwMDcwNDYxNywiZXhwIjoxODE2MjM3NDE3LCJzY29wZXMiOnsiYWN0aXZpdGllcyI6WyJyZWFkIiwid3JpdGUiXSwibWVzc2FnZXMiOlsicmVhZCIsIndyaXRlIl0sImNvbnRhY3RzIjpbInJlYWQiLCJ3cml0ZSJdfSwic29fdXNlcl9pZCI6IjEzMzIiLCJzb191c2VyX3JvbGUiOiJ1c2VyIiwic29fcHJvZmlsZSI6ImFsbCIsInNvX3VzZXJfbmFtZSI6IiIsInNvX2FwaWtleSI6Im5vbmUifQ.eg2eZfgp8o9uZTE2EAU77J3EKg_5tXzkL2LmzwKNzgI");
        messages:setJsonPayload(request,payload);
        message response = {};
            
        response = http:ClientConnector.post(SMSEP,"/v7/messages", request);

        reply response;
    }
}
