// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_proof_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialProofDTO _$CredentialProofDTOFromJson(Map<String, dynamic> json) =>
    CredentialProofDTO(
      root: json['root'] as String,
      proof: ProofDTO.fromJson(json['proof'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CredentialProofDTOToJson(CredentialProofDTO instance) =>
    <String, dynamic>{
      'root': instance.root,
      'proof': instance.proof,
    };
