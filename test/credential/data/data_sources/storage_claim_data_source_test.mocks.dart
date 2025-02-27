// Mocks generated by Mockito 5.3.2 from annotations
// in polygonid_flutter_sdk/test/credential/data/data_sources/storage_claim_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:polygonid_flutter_sdk/credential/data/data_sources/storage_claim_data_source.dart'
    as _i5;
import 'package:sembast/sembast.dart' as _i2;
import 'package:sembast/src/api/client.dart' as _i6;
import 'package:sembast/src/api/transaction.dart' as _i4;

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

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i2.Database {
  MockDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get version => (super.noSuchMethod(
        Invocation.getter(#version),
        returnValue: 0,
      ) as int);
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: '',
      ) as String);
  @override
  _i3.Future<T> transaction<T>(
          _i3.FutureOr<T> Function(_i4.Transaction)? action) =>
      (super.noSuchMethod(
        Invocation.method(
          #transaction,
          [action],
        ),
        returnValue: _i3.Future<T>.value(null),
      ) as _i3.Future<T>);
  @override
  _i3.Future<dynamic> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}

/// A class which mocks [ClaimStoreRefWrapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockClaimStoreRefWrapper extends _i1.Mock
    implements _i5.ClaimStoreRefWrapper {
  MockClaimStoreRefWrapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i2.RecordSnapshot<String, Map<String, Object?>>>> find(
    _i6.DatabaseClient? databaseClient, {
    _i2.Finder? finder,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #find,
          [databaseClient],
          {#finder: finder},
        ),
        returnValue: _i3.Future<
                List<_i2.RecordSnapshot<String, Map<String, Object?>>>>.value(
            <_i2.RecordSnapshot<String, Map<String, Object?>>>[]),
      ) as _i3.Future<List<_i2.RecordSnapshot<String, Map<String, Object?>>>>);
  @override
  _i3.Future<Map<String, Object?>?> get(
    _i6.DatabaseClient? database,
    String? key,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [
            database,
            key,
          ],
        ),
        returnValue: _i3.Future<Map<String, Object?>?>.value(),
      ) as _i3.Future<Map<String, Object?>?>);
  @override
  _i3.Future<Map<String, Object?>> put(
    _i6.DatabaseClient? database,
    String? key,
    Map<String, Object?>? value, {
    bool? merge,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            database,
            key,
            value,
          ],
          {#merge: merge},
        ),
        returnValue:
            _i3.Future<Map<String, Object?>>.value(<String, Object?>{}),
      ) as _i3.Future<Map<String, Object?>>);
  @override
  _i3.Future<String?> remove(
    _i6.DatabaseClient? database,
    String? identifier,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #remove,
          [
            database,
            identifier,
          ],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<int> removeAll(_i6.DatabaseClient? database) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeAll,
          [database],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
}
