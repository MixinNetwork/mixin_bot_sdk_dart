## 1.4.1

* Add `groupConversationId` and `uniqueConversationId` utility functions for generating deterministic group conversation IDs
* Add `randomId` field to `ConversationRequest` class

## 1.4.0

* update dart version

## 1.3.2

* add `TokenApi.fetchAssets` api

## 1.3.1

* Revert to 1.2.10 with following exceptions preserved:
* Mark `deactive` and `deactiveVerification` as deprecated in favor of `deactivate` and `deactivateVerification`
* Fix `queryAsset` and `search` api

## 1.3.0

* Fix message offset api

## 1.2.12

* Revert offset parameter type from `String?` to `int?` in all APIs

## 1.2.11

* Fix URL encoding for path parameters
* Fix query parameters handling for optional values
* Change offset parameter type from `String?` to `int?` in all APIs
* Mark `deactive` and `deactiveVerification` as deprecated in favor of `deactivate` and `deactivateVerification`

## 1.2.10

* add `kernel_asset_id` field to `SafeSnapshot`

## 1.2.9

* update verification response

## 1.2.8

* Fix code generation for `Asset` class.

## 1.2.7

* `Asset` add `displaySymbol` and `displayName` field.

## 1.2.6

* fix queryAssets and topAsset
* downgrade `collections` to 1.18.0

## 1.2.5

* `User` add `Membership` field.

## 1.2.4

* More example

## 1.2.3

* `Token` add `collection_hash` field.

## 1.2.2

* add inscription item and collection api

## 1.2.1

* add removeSticker api

## 1.2.0

**BREAKING CHANGE**

* Remove fallback to `zeromesh` host when api errored.
* Introduce `Key` class to replace `String spendKey` and `String sessionPrivateKey`

**Other**

* allow preference for asset fee.
* allow traceId specification

## 1.1.0

* improve transaction to multi uuid receiver
* add transaction to MixAddress

## 1.0.4

* make `getOutputs()` members parameter nullable
* add tip pin update apis
* support withdrawal

## 1.0.3

* fix not compat with dart 3.0

## 1.0.2

* fix tx encoder

## 1.0.1

* add utxo api

## 0.4.3

* safe_snapshot add deposit and withdrawal field

## 0.4.2

* add token api

## 0.4.1

* Add `isDeactivated` to `User class;

## 0.4.0

* Requires Dart 3.0 or later.

## 0.3.17

* Remove `AssetApi.getAssetPrecisionById`;
* Add `precision` to `Asset` class;
* Update minimum version is 2.15.0;

## 0.3.16

* `oauth_api` add `authorize`, `authorizations` and `deAuthorize`.

## 0.3.15

* `asset_api` add `getChain` and `getChains`.

## 0.3.14

* `acount_api` add `getExternalSchemes`.
* `acount_api` add `getExternalAddressFee`.
* `asset_api` add `getAssetPrecisionById`.
* `PaymentRequest` add `destination` and `rawPaymentUrl` field.
* `WithdrawalRequest` update `addressId` to optional, add `assetId`,`destination`,`tag` field.

## 0.3.13

* Set `'application/json; charset=utf-8''` to `dio.contentType`.

## 0.3.12

* Upgrade `dio` to `5.0.0` version.

## 0.3.11

* Upgrade `dio` to `diox`.

## 0.3.10

* Add `AttachmentMessage.shareable`.

## 0.3.9

* `LiveMessage` and `AttachmentMessage` fromJson now can accept string for int field.

## 0.3.8

* update deps.
* fix Uint64 accessor not supported by dart2js by [DeanLee2013](https://github.com/DeanLee2013)
* add AccountApi.preferences method

## 0.3.7

* update dependency version
* account_api#code add multisig_request, authorization, payment object.

## 0.3.6

* add outputApi.
* add collectibleApi.requests
* code api support non_fungible_request

## 0.3.5

* add pin logs api
* fix delete address api
* fix sign token

## 0.3.4

* add feeAssetId to `Address` and `Asset` response.

## 0.3.3

* add `codeId` and `codeUrl` field to `User` type.

## 0.3.2

* fix invalid account api pin request path.
* add `deactiveVerification` and `deactive` account api.

## 0.3.1

* add `state` field to `Snapshot` class.

## 0.3.0

## 0.2.16

## 0.2.15

* Add `ConversationApi.disappear`.

## 0.2.14

Add `VerificationResponse.deactivatedAt`.

## 0.2.13

Add login with phone number api.

## 0.2.12

Add `StickerAlbum.isVerified`

## 0.2.11

Fix `MessageApi.messageStatusOffset`
Add `BlazeMessageData`
Add `MessageStatus`

## 0.2.10

Fix `StickerRequest`

## 0.2.9

Add user favorite app api.

## 0.2.8

Update dependencies

## 0.2.7

Add `AccountApi.getStickerAlbum`

## 0.2.6

Add `AccountApi.addSticker`.

## 0.2.5

Fix parse json.

## 0.2.4

Add `StickerAlbum.banner`.

## 0.2.2

Add `AccountApi.code` and `ConversationApi.join` API.

`ConversationApi.exit` return type change to void.

remove `EnumToString`, change to use top level function: `enumConvertToString`, `fromStringToEnum`

## 0.2.1

Fix location message

## 0.2.0

Fix some api cause NPE.

1. `getProvisioningId` return `ProvisioningId` instead of `Provisioning`.
2. class `Provisioning` field: `platform` `provisioningCode` `sessionId` `userId` to nullable.
3. class `CircleConversation` field: `pinTime` to nullable.

## 0.1.1

Add search user API

## 0.1.0

More sticker API

## 0.0.8

More message type

## 0.0.7

Delete the default setting Accept-Language en_us, and update dependencies.

## 0.0.6

Support oauth token

## 0.0.5

Support oauth token

## 0.0.4

Fix oauth API

## 0.0.3

Export more vo class

## 0.0.2

Add API error codes

## 0.0.1

Initial version
