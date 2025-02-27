// Mocks generated by Mockito 5.3.2 from annotations
// in polygonid_flutter_sdk/test/iden3comm/domain/use_cases/authenticate_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:polygonid_flutter_sdk/common/domain/use_cases/get_config_use_case.dart'
    as _i12;
import 'package:polygonid_flutter_sdk/common/domain/use_cases/get_package_name_use_case.dart'
    as _i13;
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/jwz_proof_entity.dart'
    as _i9;
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/request/auth/auth_iden3_message_entity.dart'
    as _i4;
import 'package:polygonid_flutter_sdk/iden3comm/domain/repositories/iden3comm_repository.dart'
    as _i2;
import 'package:polygonid_flutter_sdk/iden3comm/domain/use_cases/get_auth_token_use_case.dart'
    as _i11;
import 'package:polygonid_flutter_sdk/iden3comm/domain/use_cases/get_iden3comm_proofs_use_case.dart'
    as _i10;
import 'package:polygonid_flutter_sdk/identity/domain/entities/identity_entity.dart'
    as _i6;
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_did_identifier_use_case.dart'
    as _i14;
import 'package:polygonid_flutter_sdk/proof/domain/entities/gist_proof_entity.dart'
    as _i8;
import 'package:polygonid_flutter_sdk/proof/domain/entities/proof_entity.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Iden3commRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIden3commRepository extends _i1.Mock
    implements _i2.Iden3commRepository {
  MockIden3commRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> authenticate({
    required _i4.AuthIden3MessageEntity? request,
    required String? authToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [],
          {
            #request: request,
            #authToken: authToken,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<_i5.Uint8List> getAuthInputs({
    required String? did,
    required int? profileNonce,
    required String? challenge,
    required List<String>? authClaim,
    required _i6.IdentityEntity? identity,
    required String? signature,
    required _i7.ProofEntity? incProof,
    required _i7.ProofEntity? nonRevProof,
    required _i8.GistProofEntity? gistProof,
    required Map<String, dynamic>? treeState,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAuthInputs,
          [],
          {
            #did: did,
            #profileNonce: profileNonce,
            #challenge: challenge,
            #authClaim: authClaim,
            #identity: identity,
            #signature: signature,
            #incProof: incProof,
            #nonRevProof: nonRevProof,
            #gistProof: gistProof,
            #treeState: treeState,
          },
        ),
        returnValue: _i3.Future<_i5.Uint8List>.value(_i5.Uint8List(0)),
      ) as _i3.Future<_i5.Uint8List>);
  @override
  _i3.Future<String> getAuthResponse({
    required String? did,
    required _i4.AuthIden3MessageEntity? request,
    required List<_i9.JWZProofEntity>? scope,
    String? pushToken,
    String? didIdentifier,
    String? packageName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAuthResponse,
          [],
          {
            #did: did,
            #request: request,
            #scope: scope,
            #pushToken: pushToken,
            #didIdentifier: didIdentifier,
            #packageName: packageName,
          },
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
  @override
  _i3.Future<String> getChallenge({required String? message}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getChallenge,
          [],
          {#message: message},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [GetIden3commProofsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetIden3commProofsUseCase extends _i1.Mock
    implements _i10.GetIden3commProofsUseCase {
  MockGetIden3commProofsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i9.JWZProofEntity>> execute(
          {required _i10.GetIden3commProofsParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#param: param},
        ),
        returnValue:
            _i3.Future<List<_i9.JWZProofEntity>>.value(<_i9.JWZProofEntity>[]),
      ) as _i3.Future<List<_i9.JWZProofEntity>>);
}

/// A class which mocks [GetAuthTokenUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAuthTokenUseCase extends _i1.Mock
    implements _i11.GetAuthTokenUseCase {
  MockGetAuthTokenUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> execute({required _i11.GetAuthTokenParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#param: param},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [GetEnvConfigUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetEnvConfigUseCase extends _i1.Mock
    implements _i12.GetEnvConfigUseCase {
  MockGetEnvConfigUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> execute({required _i12.PolygonIdConfig? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#param: param},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [GetPackageNameUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPackageNameUseCase extends _i1.Mock
    implements _i13.GetPackageNameUseCase {
  MockGetPackageNameUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> execute({dynamic param}) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#param: param},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}

/// A class which mocks [GetDidIdentifierUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetDidIdentifierUseCase extends _i1.Mock
    implements _i14.GetDidIdentifierUseCase {
  MockGetDidIdentifierUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> execute({required _i14.GetDidIdentifierParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#param: param},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}
