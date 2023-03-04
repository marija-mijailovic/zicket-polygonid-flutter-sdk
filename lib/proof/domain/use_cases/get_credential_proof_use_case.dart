import 'package:polygonid_flutter_sdk/common/domain/domain_logger.dart';
import 'package:polygonid_flutter_sdk/common/domain/use_case.dart';
import 'package:polygonid_flutter_sdk/common/domain/use_cases/get_config_use_case.dart';
import 'package:polygonid_flutter_sdk/identity/domain/repositories/identity_repository.dart';
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_did_use_case.dart';
import 'package:polygonid_flutter_sdk/proof/domain/entities/credential_proof_entity.dart';
import '../repositories/proof_repository.dart';

class GenerateIDParam {
  final String did;
  final String privateKey;

  GenerateIDParam(this.did, this.privateKey);
}

class GetCredentialProofUseCase
    extends FutureUseCase<String, CredentialProofEntity> {
  final ProofRepository _proofRepository;
  final IdentityRepository _identityRepository;
  final GetEnvConfigUseCase _getEnvConfigUseCase;
  final GetDidUseCase _getDidUseCase;

  GetCredentialProofUseCase(
    this._proofRepository,
    this._identityRepository,
    this._getEnvConfigUseCase,
    this._getDidUseCase,
  );

  @override
  Future<CredentialProofEntity> execute({required String param}) async {
    logger()
        .i("CONTR PARAM ENV ADDR ${PolygonIdConfig.idStateContractAddress}");
    return Future.wait([
      _getEnvConfigUseCase.execute(
          param: PolygonIdConfig.idStateContractAddress),
      _getDidUseCase.execute(param: param).then(
          (did) => _identityRepository.convertIdToBigInt(id: did.identifier))
    ])
        .then((values) => _proofRepository.getCredentialProof(
            idAsInt: values[1],
            contractAddress: "0x13E3a97607c820d44f51931C0550D9a432Ca22ED"))
        .then((proof) {
      logger().i(
          "[GetCredentialProofUseCase] Credential proof $proof for identifier $param");

      return proof;
    }).catchError((error) {
      logger().e("[GetCredentialProofUseCase] Error: $error");

      throw error;
    });
  }
}
