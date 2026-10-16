// Creates auction drafts for several catalog items, each linked to a charity, and
// prints the draft ID returned for every item.

import ballerina/io;
import ballerina/lang.regexp;
import ballerinax/ebay.listing;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string marketplaceId = "EBAY_US";
configurable string categoryId = ?;
configurable string charityId = ?;
configurable string donationPercentage = "10";
configurable string itemTitles = ?;
configurable string startPrice = ?;
configurable string reservePrice = ?;

public function main() returns error? {
    listing:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            refreshToken,
            refreshUrl
        }
    });

    foreach string entry in regexp:split(re `,`, itemTitles) {
        string title = entry.trim();
        if title.length() == 0 {
            continue;
        }
        listing:ItemDraft draft = {
            condition: "USED_EXCELLENT",
            format: "AUCTION",
            categoryId,
            product: {title},
            charity: {charityId, donationPercentage},
            pricingSummary: {
                auctionStartPrice: {currency: "USD", value: startPrice},
                auctionReservePrice: {currency: "USD", value: reservePrice}
            }
        };
        listing:ItemDraftResponse response = check ebay->createItemDraft({xEBAYCMARKETPLACEID: marketplaceId}, draft);
        string? draftId = response?.itemDraftId;
        if draftId is () {
            return error("eBay did not return a draft ID for " + title);
        }
        io:println(title, " -> draft ", draftId);
    }
}
