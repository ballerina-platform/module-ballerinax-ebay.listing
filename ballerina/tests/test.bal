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
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.ebay.com/sell/listing/v1_beta" : "http://localhost:9090/sell/listing/v1_beta";
final string token = isLiveServer ? os:getEnv("EBAY_ACCESS_TOKEN") : "test_token";

final Client ebayClient = check new ({auth: {token}, httpVersion: http:HTTP_1_1}, serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
function testCreateItemDraft() returns error? {
    ItemDraftResponse response = check ebayClient->createItemDraft(
        {xEBAYCMARKETPLACEID: "EBAY_US", contentLanguage: "en-US"},
        {
            condition: "NEW",
            categoryId: "112529",
            format: "FIXED_PRICE",
            product: {
                title: "Acme AX-200 Wireless Bluetooth Over-Ear Headphones, Black",
                brand: "Acme",
                description: "Over-ear wireless headphones"
            },
            pricingSummary: {price: {currency: "USD", value: "59.99"}}
        }
    );
    test:assertTrue(response?.itemDraftId !is ());
}
