# PolygonID Flutter SDK Example App

Demonstrates how to use the polygonid_flutter_sdk plugin.

**Contents**
1. [Setup](#setup)
2. [Examples](#examples)
   - [SDK initialization](#polygonid-sdk-initialization)
   - [Identity](#identity)
   - [Authentication](#authentication)
   - [Credential](#credential)
## Setup

### Install
1. Clone the `polygonid-flutter-sdk` repository.
2. Run `flutter pub get` from example directory.
3. After the previous steps, build and run the project.

## Examples

### PolygonId SDK initialization
Before you can start using the SDK, you need to initialise it, otherwise a `PolygonIsSdkNotInitializedException` exception will be thrown.  
For convenience you can initialise it in the main class like that:
```dart
import 'package:flutter/material.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';

Future<void> main() async {
  await PolygonIdSdk.init();
  runApp(const App());
}
```

### Identity
#### Create identity
If not yet created, create an identity via `identity.createIdentity();`
```dart
Future<void> createIdentity() async {
  //we get the sdk instance previously initialized
  final sdk = PolygonIdSdk.I;
  PrivateIdentityEntity identity = await sdk.identity.createIdentity(
     secret: secretKey,
     blockchain: blockchain,
     network: network,
  );
}
```
- `secret` param in the `createIdentity()` is optional, if not passed there will be one generated randomly.
- `blockchain` and `network` are not optional, they are used to associate the identity to a specific blockchain network.
- it is recommended to securely save the `privateKey` generated with `createIdentity()`, this will often be used within the sdk methods as a security system, you can find the `privateKey` in the `PrivateIdentityEntity` object.

#### Get identifier
Get the DID identifier from previously created identity via `identity.getDidIdentifier();` by passing as param the `privateKey`, `blockchain` and `network`.
```dart
Future<void> getDidIdentifier() async {
  String privateKey = privateIdentityEntity.privateKey;
  String didIdentifier = await sdk.identity.getDidIdentifier(
     privateKey: privateKey,
     blockchain: blockchain,
     network: network,
  );
}
```

#### Remove identity
To remove an `identity` call `identity.removeIdentity()`, the `privateKey` and the `genesisDid` of the `identity` you want to remove are needed.
```dart
Future<void> removeIdentity({
  required String privateKey,
  required String genesisDid,
}) async {
   await sdk.identity.removeIdentity(
      privateKey: privateKey,
      genesisDid: genesisDid,
   );
}
```
- `genesisDid` is the unique id of the identity which profileNonce is 0.

#### Sign a message
To sign a message with your `privateKey` call `identity.sign()`, with the `message` and `privateKey`. (The `message` String must be an Hex or a Int otherwise an Exception will be thrown)
A `signature` containing a `BigInt` is returned as a String.
```dart
Future<void> signMessage({
  required String privateKey,
  required String message,
}) async {
  String signature = await sdk.identity.signMessage(
    privateKey: privateKey,
    message: message,
  );
}
```

#### Backup identity
To backup an identity call `identity.backupIdentity()`, with the `privateKey`, `blockchain` and `network`.
A map of profile nonces and associated encrypted Identity's Databases is returned.
```dart
Future<Map<int, String>?> backupIdentity({
  required String privateKey,
  required blockchain,
  required network,
}){
  return sdk.identity.backupIdentity(
    privateKey: privateKey,
    blockchain: blockchain,
    network: network,
  );
}
```

#### Restore identity
To restore an identity call `identity.restoreIdentity()`, with the `privateKey`, `blockchain`, `network` and the `backup`.
```dart
Future<void> restoreIdentity({
  required String privateKey,
  required blockchain,
  required network,
  required Map<int, String> backup,
}) async {
  await sdk.identity.restoreIdentity(
    privateKey: privateKey,
    blockchain: blockchain,
    network: network,
    backup: backup,
  );
}
```

#### Check identity validity
To check if an identity is valid call `identity.checkIdentityValidity()`, with the `secret`, `blockchain` and `network`.
```dart
Future<bool> checkIdentityValidity({
  required String secret,
  required blockchain,
  required network,
}) async {
  return sdk.identity.checkIdentityValidity(
    secret: secret,
    blockchain: blockchain,
    network: network,
  );
}
```

### Authentication
After the identity has been created, it can be used to perform an authentication.

#### Iden3Message
Communication between the various actors takes place through `iden3message` object, provided for example by a QR Code, in order to facilitate the translation from `String` to `Iden3message`, it is possible to use this method of the SDK `iden3comm.getIden3Message()`, providing the `String` message as param.
```dart
Iden3MessageEntity getIden3MessageFromString(String message){
  return sdk.iden3comm.getIden3Message(message: message);
}
```

#### Authenticate
In order to authenticate, you will need to pass the following parameters, `iden3message` related to the authentication request, the `did` and the `privateKey`
```dart
Future<void> authenticate({
  required Iden3MessageEntity iden3message,
  required String did,
  required String privateKey,
}) async {
  await sdk.iden3comm.authenticate(
    iden3message: iden3message,
    did: did,
    privateKey: privateKey,
  );
}
```

### Credential
The credential consists of **claims**, to retrieve them from an **Issuer** and save them in the **wallet** is possible to use `iden3comm.fetchAndSaveClaims()` method, these **claims** will later be used to **prove** one's **Identity** in a **Verifier**. Saved **claims** can be `updated` or `removed` later.

#### Fetch and Save Claims
From the **iden3message** obtained from **Issuer**, you can pass it as `OfferIden3MessageEntity` to the `fetchAndSaveClaims` method along with the `did` and `privateKey`.
```dart
Future<void> fetchAndSaveClaims({
  required OfferIden3MessageEntity message,
  required String did,
  required String privateKey,
}) async {
  await sdk.iden3comm.fetchAndSaveClaims(
    message: message,
    did: did,
    privateKey: privateKey,
  );
}

```

#### Get Claims
It is possible to retrieve **claims** saved on the sdk through the use of the `credential.getClaims()`, with `filters` as optional param, `did` and `privateKey` are mandatory fields.
```dart
Future<void> getClaims({
  List<FilterEntity>? filters,
  required String did,
  required String privateKey,
}) async {
  List<ClaimEntity> claimList = await sdk.claim.getClaims(
    filters: filters,
    did: did,
    privateKey: privateKey,
  );
}
```

#### Get Claims by id
If you want to obtain specific **claims** by knowing the **ids**, you can use the sdk method `credential.getClaimsByIds()`, passing the desired `ids`, `did` and `privateKey` as parameters.
```dart
Future<void> getClaimsByIds({
  required List<String> claimIds,
  required String did,
  required String privateKey,
}) async {
  List<ClaimEntity> claimList = await sdk.credential.getClaimsByIds(
    claimIds: claimIds,
    did: did,
    privateKey: privateKey,
  );
}
```

#### Remove single Claim
To **remove** a **claim**, simply call the `credential.removeClaim()` with the `id` of the **claim** you want to remove, you must also pass the `did` and `privateKey`.
```dart
Future<void> removeClaim({
  required String claimId,
  required String did,
  required String privateKey,
}) async {
  await sdk.credential.removeClaim(
    claimId: claimId,
    did: did,
    privateKey: privateKey,
  );
}
```

#### Remove multiple Claims
If you want to **remove** a series of **claims**, you have to pass a list of `ids` and call  `credential.removeClaims()`.
```dart
Future<void> removeClaims({
  required List<String> claimIds,
  required String did,
  required String privateKey,
}) async {
  await sdk.credential.removeClaims(
    claimIds: claimIds,
    did: did,
    privateKey: privateKey,
  );
}
```

#### Update Claim
It is also possible to **update** a **claim** through `credential.updateClaim()`.   
**Attention**: as stated in the documentation of this method, only the `info` field can be updated, in addition a validation is performed from the data layer:
> Update the Claim associated to the [id] in storage  
> Be aware only the [ClaimEntity.info] will be updated.  
> and [data] is subject to validation by the data layer
```dart
Future<void> updateClaim({
  required String claimId,
  required String did,
  required String privateKey,
  String? issuer,
  ClaimState? state,
  String? expiration,
  String? type,
  Map<String, dynamic>? data,
}) async {
  PolygonIdSdk sdk = PolygonIdSdk.I;
  await sdk.credential.updateClaim(
    claimId: claimId,
    did: did,
    privateKey: privateKey,
    issuer: issuer,
    state: state,
    expiration: expiration,
    type: type,
    data: data,
  );
}
```