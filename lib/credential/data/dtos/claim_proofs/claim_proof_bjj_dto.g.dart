// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_proof_bjj_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimProofBJJDTO _$ClaimProofBJJDTOFromJson(Map<String, dynamic> json) =>
    ClaimProofBJJDTO(
      $enumDecode(_$ClaimProofTypeEnumMap, json['type']),
      ClaimProofIssuerDTO.fromJson(json['issuerData'] as Map<String, dynamic>),
      json['coreClaim'] as String,
      json['signature'] as String,
    );

Map<String, dynamic> _$ClaimProofBJJDTOToJson(ClaimProofBJJDTO instance) =>
    <String, dynamic>{
      'type': _$ClaimProofTypeEnumMap[instance.type]!,
      'issuerData': instance.issuer.toJson(),
      'coreClaim': instance.coreClaim,
      'signature': instance.signature,
    };

const _$ClaimProofTypeEnumMap = {
  ClaimProofType.bjj: 'BJJSignature2021',
  ClaimProofType.sparseMerkle: 'Iden3SparseMerkleProof',
};

ClaimProofIssuerBJJDTO _$ClaimProofIssuerBJJDTOFromJson(
        Map<String, dynamic> json) =>
    ClaimProofIssuerBJJDTO(
      json['id'] as String,
      ClaimProofIssuerStateDTO.fromJson(json['state'] as Map<String, dynamic>),
      json['authCoreClaim'] as String,
      ClaimProofMTPDTO.fromJson(json['mtp'] as Map<String, dynamic>),
      ClaimProofIssuerCredStatusDTO.fromJson(
          json['credentialStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimProofIssuerBJJDTOToJson(
        ClaimProofIssuerBJJDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state.toJson(),
      'authCoreClaim': instance.authCoreClaim,
      'mtp': instance.mtp.toJson(),
      'credentialStatus': instance.credentialStatus.toJson(),
    };
