// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/log;

listener http:Listener httpListener = new (9090);

http:Service mockAPI = service object {

    # Get Presence
    #
    # + return - Get Presence
    resource isolated function get users\.getPresence() returns json => {
        "ok": true,
        "presence": "away",
        "online": false,
        "auto_away": false,
        "manual_away": false,
        "connection_count": 0
    };

    # Post Message
    #
    # + return - json
    resource isolated function post chat\.postMessage(@http:Payload http:Request request) returns ChatPostMessageResponse => {
        ok: true,
        channel: "C078KJ7SW78",
        ts: "1719830298.784769",
        message: {
            user: "U078KJ7RX1U",
            'type: "message",
            ts: "1719830298.784769",
            botId: [],
            text: "This is a Test",
            team: "T078S42MC59",
            botProfile: {
                id: "B07986E3N4E",
                appId: "A079SKHD00Z",
                name: "test-app",
                icons: {
                    image36: "https://a.slack-edge.com/80588/img/plugins/app/bot_36.png",
                    image48: "https://a.slack-edge.com/80588/img/plugins/app/bot_48.png",
                    image72: "https://a.slack-edge.com/80588/img/plugins/app/service_72.png"
                },
                deleted: false,
                updated: 1719218992,
                teamId: "T078S42MC59"
            },
            blocks: [
                {
                    "type": "rich_text",
                    "block_id": "I/L",
                    "elements": [
                        {
                            "type": "rich_text_section",
                            "elements": [
                                {
                                    "type": "text",
                                    "text": "This is a Test"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    };

    # List Users
    #
    # + return - List Users
    resource isolated function get users\.list() returns UsersListResponse => {
        ok: true,
        cacheTs: 1697039999,
        members: [
            [<UserObjAnyOf1>{
                isAppUser: true,
                isBot: false,
                updated: 0,
                id: "U078KJ7RX1U",
                teamId: "T078S42MC59",
                name: "adib",
                deleted: false,
                color: "9c3b2a",
                realName: "Adib Samoon",
                tzLabel: "Sri Lanka Standard Time",
                tzOffset: 19800,
                profile: {
                    avatarHash: "",
                    statusText: "",
                    statusEmoji: ":)",
                    displayName: "",
                    realNameNormalized: "Adib Samoon",
                    displayNameNormalized: "Adib Samoon",
                    skype: "", 
                    realName: "",
                    phone: "",
                    title: "",
                    fields: ()
                },
                isAdmin: true,
                isOwner: true,
                isPrimaryOwner: true,
                isRestricted: false,
                isUltraRestricted: false,
                has2fa: false
            }
            ]
        ]
    };

    # Get User Profile
    #
    # + return - Get User Profile
    resource isolated function get users\.profile\.get() returns UsersProfileGetResponse => {
        ok: true,
        profile: {
            avatarHash: "",
            displayNameNormalized: "Adib Samoon",
            realName: "Adib Samoon",
            realNameNormalized: "Adib Samoon",
            statusText: "",
            statusEmoji: ":)",
            displayName: "",
            title: "",
            phone: "",
            skype: "",
            fields: [],
            email: "adib@wso2.com"
        }
    };

    # Get Upload URL External
    #
    # + return - Upload URL pointing back to this mock server
    resource isolated function post files\.getUploadURLExternal(@http:Payload http:Request request) returns json => {
        "ok": true,
        "upload_url": "http://localhost:9090/upload/v1/CwABAAAAXAoAAUnJbZW8O41d",
        "file_id": "F0CA1SH190B"
    };

    # Receive Uploaded File Contents
    #
    # + id - Upload ID
    # + return - Upload status
    resource isolated function post upload/v1/[string id](@http:Payload http:Request request) returns http:Ok => {body: "OK - 20"};

    # Complete Upload External
    #
    # + return - Completed file details
    resource isolated function post files\.completeUploadExternal(@http:Payload http:Request request) returns json => {
        "ok": true,
        "files": [
            {
                "id": "F0CA1SH190B",
                "created": 1792381427,
                "timestamp": 1792381427,
                "name": "test.txt",
                "title": "Ballerina test file",
                "mimetype": "text/plain",
                "filetype": "text",
                "pretty_type": "Plain text",
                "user": "U0C3F40S9EG",
                "user_team": "T0C39FE0MFG",
                "editable": true,
                "size": 20,
                "mode": "snippet",
                "is_external": false,
                "external_type": "",
                "is_public": false,
                "public_url_shared": false,
                "display_as_bot": false,
                "username": "",
                "is_modified_by_ai": false,
                "url_private": "https://files.slack.com/files-pri/T0C39FE0MFG-F0CA1SH190B/test.txt",
                "url_private_download": "https://files.slack.com/files-pri/T0C39FE0MFG-F0CA1SH190B/download/test.txt",
                "permalink": "https://example.slack.com/files/U0C3F40S9EG/F0CA1SH190B/test.txt",
                "permalink_public": "https://slack-files.com/T0C39FE0MFG-F0CA1SH190B-02dffd99dd",
                "preview": "hello from ballerina",
                "lines": 1,
                "lines_more": 0,
                "preview_is_truncated": false,
                "comments_count": 0,
                "is_starred": false,
                "shares": {},
                "channels": [],
                "groups": [],
                "ims": [],
                "has_more_shares": false,
                "has_rich_preview": false,
                "file_access": "visible"
            }
        ]
    };

    # Delete File
    #
    # + return - Delete status
    resource isolated function post files\.delete(@http:Payload http:Request request) returns json => {"ok": true};
};

function init() returns error? {
    if isLiveServer {
        log:printInfo("Skiping mock server initialization as the tests are running on live server");
        return;
    }
    log:printInfo("Initiating mock server");
    check httpListener.attach(mockAPI, "/");
    check httpListener.'start();
}
