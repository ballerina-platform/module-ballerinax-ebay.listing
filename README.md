# Ballerina eBay Listing connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-ebay.listing.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.listing/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/ebay.listing.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Febay.listing)

## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where sellers list items for sale. Its Listing API, a limited release API available only to select approved developers, lets a partner site create an eBay listing draft from the details of an item a seller has on the partner's site.

The eBay Listing connector gives Ballerina programs typed access to version v1_beta.3.1 of the eBay Listing API, so you can create item drafts with product details, pricing, charity information and listing format. The seller then signs in to eBay to finish and publish the listing.

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

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`ebay.listing` package](https://central.ballerina.io/ballerinax/ebay.listing/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
