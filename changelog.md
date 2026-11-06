# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `CreateItemDraftHeaders`, the typed headers record of `createItemDraft`, with the required `xEBAYCMARKETPLACEID` (sent as `X-EBAY-C-MARKETPLACE-ID`) and the optional `contentLanguage` (sent as `Content-Language`).
- New `ConnectionConfig` fields, taken from `http:ClientConfiguration`: `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`.

### Changed

- **Breaking:** `createItemDraft` takes its headers as a `CreateItemDraftHeaders` record before the payload, in place of the positional marketplace ID and content language:

    ```ballerina
    // 1.5.2
    listing:ItemDraftResponse draft = check ebay->createItemDraft("EBAY_US", item, "en-US");
    ```

    ```ballerina
    // 2.0.0
    listing:ItemDraftResponse draft = check ebay->createItemDraft({xEBAYCMARKETPLACEID: "EBAY_US", contentLanguage: "en-US"}, item);
    ```

- **Breaking:** `ConnectionConfig.http1Settings` is now `http:ClientHttp1Settings` (was the connector's own `ClientHttp1Settings`).
- `ConnectionConfig.timeout` defaults to 30 seconds (was 60).

### Removed

- **Breaking:** the connector's own `ClientHttp1Settings` and `ProxyConfig` records. Use `http:ClientHttp1Settings` and `http:ProxyConfig` instead.
- **Breaking:** the `Error` and `ErrorParameter` records. No method returned either.
