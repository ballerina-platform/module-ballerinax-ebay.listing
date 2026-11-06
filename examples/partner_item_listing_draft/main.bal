// Creates an eBay listing draft for an item advertised on a partner site and prints
// the URL the seller follows to finish and publish the listing.

import ballerina/io;
import ballerinax/ebay.listing;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string marketplaceId = "EBAY_US";
configurable string categoryId = ?;
configurable string itemTitle = ?;
configurable string itemBrand = ?;
configurable string itemDescription = ?;
configurable string itemPrice = ?;

public function main() returns error? {
    listing:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            refreshToken,
            refreshUrl
        }
    });

    listing:ItemDraft draft = {
        condition: "NEW",
        format: "FIXED_PRICE",
        categoryId,
        product: {
            title: itemTitle,
            brand: itemBrand,
            description: itemDescription
        },
        pricingSummary: {
            price: {currency: "USD", value: itemPrice}
        }
    };

    listing:ItemDraftResponse response = check ebay->createItemDraft({xEBAYCMARKETPLACEID: marketplaceId}, draft);

    string? draftId = response?.itemDraftId;
    string? sellFlowUrl = response?.sellFlowUrl;
    if draftId is () || sellFlowUrl is () {
        return error("eBay did not return a draft ID and sell flow URL");
    }
    io:println("Created draft ", draftId);
    io:println("Seller completes the listing at: ", sellFlowUrl);
}
