import ballerina.net.http;
import ballerina.lang.messages;

@http:configuration {basePath:"/cnn"}
service<http> CNNSportService {
    
    @http:GET {}
    @http:Path {value:"/sport"}
    resource cnnsportresource (message m) {

        json payload = {
    "status": "ok",
    "sources": [
        {
            "id": "bbc-sport",
            "name": "BBC Sport",
            "description": "The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.",
            "url": "http://www.bbc.co.uk/sport",
            "category": "sport",
            "language": "en",
            "country": "gb",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top"
            ]
        },
        {
            "id": "espn",
            "name": "ESPN",
            "description": "ESPN has up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more.",
            "url": "http://espn.go.com",
            "category": "sport",
            "language": "en",
            "country": "us",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top"
            ]
        },
        {
            "id": "espn-cric-info",
            "name": "ESPN Cric Info",
            "description": "ESPN Cricinfo provides the most comprehensive cricket coverage available including live ball-by-ball commentary, news, unparalleled statistics, quality editorial comment and analysis.",
            "url": "http://www.espncricinfo.com/",
            "category": "sport",
            "language": "en",
            "country": "us",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "football-italia",
            "name": "Football Italia",
            "description": "Italian football news, analysis, fixtures and results for the latest from Serie A, Serie B and the Azzurri.",
            "url": "http://www.football-italia.net",
            "category": "sport",
            "language": "en",
            "country": "it",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "four-four-two",
            "name": "FourFourTwo",
            "description": "The latest football news, in-depth features, tactical and statistical analysis from FourFourTwo, the UK&#039;s favourite football monthly.",
            "url": "http://www.fourfourtwo.com/news",
            "category": "sport",
            "language": "en",
            "country": "gb",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "fox-sports",
            "name": "Fox Sports",
            "description": "Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.",
            "url": "http://www.foxsports.com",
            "category": "sport",
            "language": "en",
            "country": "us",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "nfl-news",
            "name": "NFL News",
            "description": "The official source for NFL news, schedules, stats, scores and more.",
            "url": "http://www.nfl.com/news",
            "category": "sport",
            "language": "en",
            "country": "us",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "talksport",
            "name": "TalkSport",
            "description": "Tune in to the world's biggest sports radio station - Live Premier League football coverage, breaking sports news, transfer rumours &amp; exclusive interviews.",
            "url": "http://talksport.com",
            "category": "sport",
            "language": "en",
            "country": "gb",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        },
        {
            "id": "the-sport-bible",
            "name": "The Sport Bible",
            "description": "TheSPORTbible is one of the largest communities for sports fans across the world. Send us your sporting pictures and videos!",
            "url": "http://www.thesportbible.com",
            "category": "sport",
            "language": "en",
            "country": "gb",
            "urlsToLogos": {
                "small": "",
                "medium": "",
                "large": ""
            },
            "sortBysAvailable": [
                "top",
                "latest"
            ]
        }
    ]
};
        message response={};
        messages:setJsonPayload(response,payload);

        reply response;
    }
}
