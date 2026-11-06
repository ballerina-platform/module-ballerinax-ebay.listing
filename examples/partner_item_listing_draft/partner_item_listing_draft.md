# Partner item listing draft

This example creates an eBay listing draft for an item advertised on a partner site and prints the URL the seller follows to finish and publish the listing.

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
itemTitle = "<item title>"
itemBrand = "<item brand>"
itemDescription = "<item description>"
itemPrice = "<item price>"
```

## Run the example

```bash
bal run
```
