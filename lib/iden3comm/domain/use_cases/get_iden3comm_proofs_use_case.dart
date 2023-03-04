import 'package:polygonid_flutter_sdk/common/domain/use_case.dart';
import 'package:polygonid_flutter_sdk/credential/domain/use_cases/get_claims_use_case.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/iden3_message_entity.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/jwz_proof_entity.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/proof_request_entity.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/exceptions/iden3comm_exceptions.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/repositories/iden3comm_repository.dart';
import 'package:polygonid_flutter_sdk/identity/domain/entities/did_entity.dart';
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_did_use_case.dart';
import 'package:polygonid_flutter_sdk/proof/domain/use_cases/is_proof_circuit_supported_use_case.dart';
import 'package:polygonid_flutter_sdk/sdk/credential.dart';

import '../../../common/domain/domain_logger.dart';
import '../../../credential/domain/entities/claim_entity.dart';
import '../../../credential/domain/use_cases/get_claim_revocation_status_use_case.dart';
import '../../../credential/domain/use_cases/update_claim_use_case.dart';
import '../../../identity/domain/repositories/identity_repository.dart';
import '../../../proof/domain/entities/circuit_data_entity.dart';
import '../../../proof/domain/entities/jwz/jwz_proof.dart';
import '../../../proof/domain/repositories/proof_repository.dart';
import '../../../proof/domain/use_cases/generate_proof_use_case.dart';
import 'get_iden3comm_claims_use_case.dart';
import 'get_proof_requests_use_case.dart';

class GetIden3commProofsParam {
  final Iden3MessageEntity message;
  final String did;
  final int profileNonce;
  final String privateKey;
  final String? challenge;

  GetIden3commProofsParam(
      {required this.message,
      required this.did,
      required this.profileNonce,
      required this.privateKey,
      this.challenge});
}

class GetIden3commProofsUseCase
    extends FutureUseCase<GetIden3commProofsParam, List<JWZProofEntity>> {
  final ProofRepository _proofRepository;
  final IdentityRepository _identityRepository;
  final GetIden3commClaimsUseCase _getIden3commClaimsUseCase;
  final GenerateProofUseCase _generateProofUseCase;
  final IsProofCircuitSupportedUseCase _isProofCircuitSupported;
  final GetProofRequestsUseCase _getProofRequestsUseCase;

  GetIden3commProofsUseCase(
    this._proofRepository,
    this._identityRepository,
    this._getIden3commClaimsUseCase,
    this._generateProofUseCase,
    this._isProofCircuitSupported,
    this._getProofRequestsUseCase,
  );

  @override
  Future<List<JWZProofEntity>> execute(
      {required GetIden3commProofsParam param}) async {
    List<JWZProofEntity> proofs = [];

    List<ProofRequestEntity> requests =
        await _getProofRequestsUseCase.execute(param: param.message);

    List<String> publicKey = await _identityRepository
        .getIdentity(
          genesisDid: param.did,
        )
        .then((identity) => identity.publicKey);

    for (ProofRequestEntity request in requests) {
      // Claims
      ClaimEntity credential = ClaimEntity(
          id: "1",
          issuer: "Zicket",
          did: param.did,
          state: ClaimState.active,
          type: "ProofOfHumanity",
          info: {});
      logger().i("CREDENTIAL $credential");
      String circuitId = request.scope.circuitId;

      CircuitDataEntity circuitData =
          await _proofRepository.loadCircuitFiles(circuitId);

      String? challenge;
      String? privKey;
      privKey = param.privateKey;
      challenge = param.challenge;

      //logger().i("JWZ PROOF $jwzProof");
      //proofs.add(jwzProof);

      // Generate proof
      logger().i("[get_iden3comm proofs use case]");
      JWZProof proof = await _generateProofUseCase.execute(
          param: GenerateProofParam(param.did, param.profileNonce, 0,
              credential, request.scope, circuitData, privKey, challenge));
      logger().i(proof);
      // proofs.add(await _generateProofUseCase
      //     .execute(
      //         param: GenerateProofParam(param.did, param.profileNonce, 0,
      //             credential, request.scope, circuitData, privKey, challenge))
      //     .then((proof) => JWZProofEntity(
      //         id: request.scope.id,
      //         circuitId: circuitId,
      //         proof: proof.proof,
      //         pubSignals: proof.pubSignals)));
    }

    /// If we have requests but didn't get any proofs, we throw
    /// as it could be we didn't find any associated [ClaimEntity]
    if (requests.isNotEmpty && proofs.isEmpty) {
      throw ProofsNotFoundException(requests);
    }

    return proofs;
  }
}
