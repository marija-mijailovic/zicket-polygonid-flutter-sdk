/*
{
  "type": "https://iden3-communication.io/authorization-response/v1",
  "data": {
    "scope": [
      {
        "type": "zeroknowledge",
        "circuit_id": "auth",
        "pub_signals": [
          "383481829333688262229762912714748186426235428103586432827469388069546950656",
          "12345"
        ],
        "proof_data": {
          "pi_a": [
            "14146277947056297753840642586002829867111675410988595047766001252156753371528",
            "14571022849315211248046007113544986624773029852663683182064313232057584750907",
            "1"
          ],
          "pi_b": [
            [
              "16643510334478363316178974136322830670001098048711963846055396047727066595515",
              "10398230582752448515583571758866992012509398625081722188208617704185602394573"
            ],
            [
              "6754852150473185509183929580585027939167256175425095292505368999953776521762",
              "4988338043999536569468301597030911639875135237017470300699903062776921637682"
            ],
            [
              "1",
              "0"
            ]
          ],
          "pi_c": [
            "17016608018243685488662035612576776697709541343999980909476169114486580874935",
            "1344455328868272682523157740509602348889110849570014394831093852006878298645",
            "1"
          ],
          "protocol": "groth16"
        }
      }
    ]
  }
}

{
  "type": "https://iden3-communication.io/authorization-request/v1",
  "data": {
    "callbackUrl": "https://auth-demo.idyllicvision.com/callback?id=27887",
    "audience": "1125GJqgw6YEsKFwj63GY87MMxPL9kwDKxPUiwMLNZ",
    "scope": [
      {
        "circuit_id": "auth",
        "type": "zeroknowledge",
        "rules": {
          "audience": "1125GJqgw6YEsKFwj63GY87MMxPL9kwDKxPUiwMLNZ",
          "challenge": 27887
        }
      }
    ]
  }
}

*/

import 'dart:convert';

import 'package:polygonid_flutter_sdk/proof/domain/entities/jwz/jwz_proof.dart';

import 'jwz_proof_entity.dart';

/// Sample
/// ``` "vp":{
///       "verifiableCredential": {
///         "documentType": 99,
///         "@type": "KYCAgeCredential"
///       },
///       "@type": "VerifiablePresentation",
///       "@context": [
///         "https://www.w3.org/2018/credentials/v1",
///         "https://raw.githubusercontent.com/iden3/claim-schema-vocab/main/schemas/json-ld/kyc-v3.json-ld"
///       ]
///   }
/// ```
class JWZVPProof {
  final Map<String, dynamic> verifiableCredential;
  final String type;
  final List<String> context;

  const JWZVPProof({
    required this.verifiableCredential,
    required this.type,
    required this.context,
  });

  factory JWZVPProof.fromJson(Map<String, dynamic> json) => JWZVPProof(
        verifiableCredential:
            (json['verifiableCredential'] as Map<String, dynamic>),
        type: json['@type'] as String,
        context: (json['@context'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'verifiableCredential': verifiableCredential,
        '@type': type,
        '@context': context,
      };

  @override
  String toString() =>
      "[JWZVPProof] {verifiableCredential: $verifiableCredential, type: $type, context: $context}";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWZVPProof &&
          runtimeType == other.runtimeType &&
          verifiableCredential == other.verifiableCredential &&
          type == other.type &&
          context == other.context;

  @override
  int get hashCode => runtimeType.hashCode;
}

class JWZSDProofEntity extends JWZProofEntity {
  final JWZVPProof vp;

  JWZSDProofEntity(
      {required int id,
      required String circuitId,
      required JWZBaseProof proof,
      required List<String> pubSignals,
      required this.vp})
      : super(
            id: id, circuitId: circuitId, proof: proof, pubSignals: pubSignals);

  /// Creates an instance from the given json
  ///
  /// @param [Map<String, dynamic>] json
  /// @returns [JWZSDProofEntity]
  factory JWZSDProofEntity.fromJson(Map<String, dynamic> json) {
    JWZBaseProof proof = JWZBaseProof.fromJson(json['proof']);
    List<String> pubSig = List.from(jsonDecode(json['pub_signals']));
    JWZVPProof vp = JWZVPProof.fromJson(json['vp']);

    return JWZSDProofEntity(
        id: json['id'],
        circuitId: json['circuitId'],
        proof: proof,
        pubSignals: pubSig,
        vp: vp);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'circuitId': circuitId,
        'proof': proof.toJson(),
        'pub_signals': pubSignals,
        'vp': vp.toJson(),
      };
}
