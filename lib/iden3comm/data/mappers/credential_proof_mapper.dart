import 'package:polygonid_flutter_sdk/common/mappers/to_mapper.dart';
import 'package:polygonid_flutter_sdk/identity/data/mappers/hash_mapper.dart';
import 'package:polygonid_flutter_sdk/proof/domain/entities/credential_proof_entity.dart';

class CredentialProofMapper
    extends ToMapper<Map<String, dynamic>, CredentialProofEntity> {
  final HashMapper _hashMapper;

  CredentialProofMapper(this._hashMapper);

  @override
  Map<String, dynamic> mapTo(CredentialProofEntity to) {
    Map<String, dynamic> result = {
      "root": to.root,
      "proof": {
        "existence": to.proof.existence,
        "siblings": to.proof.siblings
            .map((hashEntity) => _hashMapper.mapTo(hashEntity).toString())
            .toList()
      }
    };

    if (to.proof.nodeAux != null) {
      result["proof"]["node_aux"] = {
        "key": to.proof.nodeAux!.key,
        "value": to.proof.nodeAux!.value
      };
    }

    return result;
  }
}
