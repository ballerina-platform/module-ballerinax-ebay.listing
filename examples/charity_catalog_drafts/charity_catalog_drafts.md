# Charity catalog drafts

This example creates auction drafts for several catalog items, each linked to a charity, and prints the draft ID returned for every item.

## Prerequisites

- An eBay developer application approved for the Listing API (Limited Release).
- An OAuth refresh token carrying the `https://api.ebay.com/oauth/api_scope/sell.item.draft` scope.

## Configuration

Create a `Config.toml` in the example directory:

```toml
clientId = "<client id>"
clientSecret = "<client secret>"
refreshToken = "<refresh token>"
refreshUrl = "<eBay token endpoint>"
marketplaceId = "EBAY_US"
categoryId = "<eBay category id>"
charityId = "<charity id>"
donationPercentage = "10"
itemTitles = "<item title 1>,<item title 2>"
startPrice = "<auction start price>"
reservePrice = "<auction reserve price>"
```

## Run the example

```bash
bal run
```
