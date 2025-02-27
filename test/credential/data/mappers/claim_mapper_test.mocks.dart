// Mocks generated by Mockito 5.3.2 from annotations
// in polygonid_flutter_sdk/test/credential/data/mappers/claim_mapper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:polygonid_flutter_sdk/credential/data/dtos/claim_info_dto.dart'
    as _i2;
import 'package:polygonid_flutter_sdk/credential/data/mappers/claim_info_mapper.dart'
    as _i5;
import 'package:polygonid_flutter_sdk/credential/data/mappers/claim_state_mapper.dart'
    as _i3;
import 'package:polygonid_flutter_sdk/credential/domain/entities/claim_entity.dart'
    as _i4;

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

class _FakeClaimInfoDTO_0 extends _i1.SmartFake implements _i2.ClaimInfoDTO {
  _FakeClaimInfoDTO_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ClaimStateMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockClaimStateMapper extends _i1.Mock implements _i3.ClaimStateMapper {
  MockClaimStateMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ClaimState mapFrom(String? from) => (super.noSuchMethod(
        Invocation.method(
          #mapFrom,
          [from],
        ),
        returnValue: _i4.ClaimState.active,
      ) as _i4.ClaimState);
  @override
  String mapTo(_i4.ClaimState? to) => (super.noSuchMethod(
        Invocation.method(
          #mapTo,
          [to],
        ),
        returnValue: '',
      ) as String);
}

/// A class which mocks [ClaimInfoMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockClaimInfoMapper extends _i1.Mock implements _i5.ClaimInfoMapper {
  MockClaimInfoMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, dynamic> mapFrom(_i2.ClaimInfoDTO? to) => (super.noSuchMethod(
        Invocation.method(
          #mapFrom,
          [to],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
  @override
  _i2.ClaimInfoDTO mapTo(Map<String, dynamic>? from) => (super.noSuchMethod(
        Invocation.method(
          #mapTo,
          [from],
        ),
        returnValue: _FakeClaimInfoDTO_0(
          this,
          Invocation.method(
            #mapTo,
            [from],
          ),
        ),
      ) as _i2.ClaimInfoDTO);
}
