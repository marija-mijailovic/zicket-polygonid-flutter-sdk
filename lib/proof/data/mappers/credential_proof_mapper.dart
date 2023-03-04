import 'package:polygonid_flutter_sdk/proof/domain/entities/credential_proof_entity.dart';

import '../../../common/mappers/mapper.dart';
import '../../domain/entities/gist_proof_entity.dart';
import '../dtos/credential_proof_dto.dart';
import 'proof_mapper.dart';

class CredentialProofMapper
    extends Mapper<CredentialProofDTO, CredentialProofEntity> {
  final ProofMapper _proofMapper;

  CredentialProofMapper(this._proofMapper);

  @override
  CredentialProofEntity mapFrom(CredentialProofDTO from) {
    return CredentialProofEntity(
      root: from.root,
      proof: _proofMapper.mapFrom(from.proof),
    );
  }

  @override
  CredentialProofDTO mapTo(CredentialProofEntity from) {
    return CredentialProofDTO(
      root: from.root,
      proof: _proofMapper.mapTo(from.proof),
    );
  }
}
