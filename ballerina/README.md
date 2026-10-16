## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where sellers list items for sale. Its Listing API, a limited release API available only to select approved developers, lets a partner site create an eBay listing draft from the details of an item a seller has on the partner's site.

The eBay Listing connector gives Ballerina programs typed access to version v1_beta.3.1 of the eBay Listing API, so you can create item drafts with product details, pricing, charity information and listing format. The seller then signs in to eBay to finish and publish the listing.

### Key features

- Create eBay listing drafts from items on a partner site
- Set product details, aspects, images, condition and listing format on a draft
- Add fixed price or auction pricing, including start and reserve prices
- Link a draft to a charity with a donation percentage
- Authenticate with an OAuth 2.0 refresh token or a bearer token

## Setup guide

To use the connector you need an eBay developer account with access approved for the Listing API.

1. Sign up or log in at the [eBay Developers Program](https://developer.ebay.com/).

2. Create an application keyset and request access to the Listing API from your eBay business contact, since it is available only to approved developers.

3. Under your application's user tokens, configure the OAuth redirect (RuName) and grant the `https://api.ebay.com/oauth/api_scope/sell.item.draft` scope.

4. Complete the authorization code flow for the seller account and note the client ID, client secret and refresh token. The token endpoint is `https://api.ebay.com/identity/v1/oauth2/token`.

> **Note:** Keep the client secret and refresh token out of client-side code and version control.

## Quickstart

To use the `ebay.listing` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/ebay.listing;
```

### Step 2: Instantiate a new connector

Create a `Config.toml` file with your credentials:

```toml
clientId = "<client id>"
clientSecret = "<client secret>"
refreshToken = "<refresh token>"
```

Then create the client in your `.bal` file:

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;

listing:Client ebay = check new ({
    auth: {
        clientId,
        clientSecret,
        refreshToken,
        refreshUrl: "https://api.ebay.com/identity/v1/oauth2/token"
    }
});
```

### Step 3: Invoke the connector operation

```ballerina
public function main() returns error? {
    listing:ItemDraftResponse _ = check ebay->createItemDraft(
        {xEBAYCMARKETPLACEID: "EBAY_US"},
        {
            condition: "NEW",
            categoryId: "9355",
            product: {title: "Wireless Headphones"}
        }
    );
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```


## Examples

The `eBay Listing` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/tree/main/examples/), covering the following use cases:

- [partner_item_listing_draft](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/tree/main/examples/partner_item_listing_draft) - Create a draft from a partner site item and print the URL the seller follows to publish it.
- [charity_catalog_drafts](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/tree/main/examples/charity_catalog_drafts) - Create charity linked auction drafts for several catalog items.
