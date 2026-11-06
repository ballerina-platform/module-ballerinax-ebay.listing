// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
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

listener http:Listener ep0 = new (9090);

@http:ServiceConfig {treatNilableAsOptional: true}
service /sell/listing/v1_beta on ep0 {
    # Create an item draft
    #
    # + contentLanguage - Natural language of the seller
    # + xEBAYCMARKETPLACEID - eBay marketplace ID
    # + payload - Item details used to create the eBay listing draft
    # + return - Item draft created successfully, returns the draft ID and the URL to complete the listing
    resource function post item_draft(@http:Header {name: "Content-Language"} string? contentLanguage, @http:Header {name: "X-EBAY-C-MARKETPLACE-ID"} string xEBAYCMARKETPLACEID, @http:Payload ItemDraft payload) returns ItemDraftResponse|http:BadRequest|http:InternalServerError {
        return {
            itemDraftId: "5000012345678",
            sellFlowUrl: "https://www.ebay.com/sl/sell?draftId=5000012345678",
            sellFlowNativeUri: "ebay://sell/draft/5000012345678"
        };
    }
}
