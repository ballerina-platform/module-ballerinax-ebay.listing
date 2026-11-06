_Author_:  Dimuthu Madushan \
_Created_: 2026/10/16 \
_Updated_: 2026/10/16 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from eBay Listing. 
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/ebay/listing/v1_beta.3.1/openapi.yaml).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.


1. Change the `url` property of the servers object
- **Original**: `https://api.ebay.com{basePath}`
- **Updated**: `https://api.ebay.com{basePath}/item_draft/`
- **Reason**: Common prefix added to base URL to simplify endpoint paths.
<!-- auto-generated -->

2. Update the API Paths
- **Original**: Paths included common prefix `/item_draft/` in each endpoint.
- **Updated**: Common prefix removed from endpoints as it is now in the base URL.
- **Reason**: Simplifies API paths and avoids duplication.
<!-- auto-generated -->

3. Add a summary to the `createItemDraft` operation
- **Original**: The `POST /item_draft/` operation had no `summary`.
- **Updated**: `summary: "Create an item draft"` (edited in the original `docs/spec/openapi.yaml`).
- **Reason**: Gives the generated client method a documented one-line summary.

4. Replace the generic `201` response description
- **Original**: `OK`
- **Updated**: `Item draft created successfully, returns the draft ID and the URL to complete the listing`
- **Reason**: The generic description gives no information in the generated method documentation. Edited in the original `docs/spec/openapi.yaml`.

5. Describe the `createItemDraft` request body
- **Original**: The inline request body had no description.
- **Updated**: `Item details used to create the eBay listing draft`, set in the aligned spec by the generation skill's description step.
- **Reason**: Documents the payload parameter. This edit is made to the aligned spec only, so it must be re-applied after a re-align.

6. Restore the service root and the `/item_draft/` path in the aligned spec
- **Original**: `align` folded the common prefix into the server URL (`https://api.ebay.com{basePath}/item_draft/`) and left the only path as an empty string, which `bal openapi` rejects with "Resource should start with /".
- **Updated**: The aligned spec uses the resolved server `https://api.ebay.com/sell/listing/v1_beta` (the `basePath` variable removed) and the path `/item_draft/`, which supersedes items 1 and 2 for the generated client.
- **Reason**: Client generation fails on an empty path. This is a hand edit to `aligned_ballerina_openapi.json` and must be re-applied after a re-align.

7. Replace the HTML in `info.description` with plain text
- **Original**: An HTML `tablenote` span with a link, an image and line breaks, noting that this is a Limited Release API, followed by the API summary.
- **Updated**: `This is a generated connector for the eBay Listing API. It enables a seller adding an ad or item on a Partner's site to automatically create an eBay listing draft using the item details from the Partner's site. Note: This is a Limited Release API, available only to select developers approved by business units.` (edited in the original `docs/spec/openapi.yaml` and both aligned specs).
- **Reason**: The description becomes the client's doc comment, where the HTML tags show up as raw markup.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --client-methods remote --license docs/license.txt
```

Note: The license year is hardcoded to 2026, change if necessary.
