# Tests

The test suite exercises the `createItemDraft` operation against a mock eBay Listing service defined in `tests/mock_service.bal`.

## Running Tests

```bash
bal test
```

By default the tests run against the mock server and need no credentials. To run them against the real API, set these environment variables:

```bash
export IS_LIVE_SERVER=true
export EBAY_ACCESS_TOKEN=<OAuth access token>
bal test --groups live_tests
```
