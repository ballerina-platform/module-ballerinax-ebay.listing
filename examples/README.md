# Examples

The `ballerinax/ebay.listing` connector provides practical examples illustrating usage in various scenarios.

1. [partner_item_listing_draft](./partner_item_listing_draft/partner_item_listing_draft.md) - Create a draft from a partner site item and print the URL the seller follows to publish it.
2. [charity_catalog_drafts](./charity_catalog_drafts/charity_catalog_drafts.md) - Create charity linked auction drafts for several catalog items.

## Prerequisites

Each example needs an eBay developer application approved for the Listing API and an OAuth refresh token with the `https://api.ebay.com/oauth/api_scope/sell.item.draft` scope. Create a `Config.toml` in the example directory with the values listed in its document.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
