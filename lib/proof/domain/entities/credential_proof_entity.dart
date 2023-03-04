import 'package:polygonid_flutter_sdk/proof/domain/entities/proof_entity.dart';

class CredentialProofEntity {
  final String root;
  final ProofEntity proof;

  CredentialProofEntity({required this.root, required this.proof});

  @override
  String toString() => "[CredentialProofEntity] {root: $root, proof: $proof}";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CredentialProofEntity &&
          runtimeType == other.runtimeType &&
          root.toString() == other.root.toString() &&
          proof.toString() == other.proof.toString();

  @override
  int get hashCode => runtimeType.hashCode;
}
