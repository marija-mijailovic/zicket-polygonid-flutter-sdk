import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:polygonid_flutter_sdk/credential/domain/entities/claim_entity.dart';
import 'package:polygonid_flutter_sdk/credential/domain/use_cases/get_auth_claim_use_case.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/request/auth/proof_scope_request.dart';
import 'package:polygonid_flutter_sdk/identity/domain/entities/tree_type.dart';
import 'package:polygonid_flutter_sdk/identity/domain/repositories/identity_repository.dart';
import 'package:polygonid_flutter_sdk/identity/domain/repositories/smt_repository.dart';
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_did_use_case.dart';
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_identity_use_case.dart';
import 'package:polygonid_flutter_sdk/identity/domain/use_cases/get_latest_state_use_case.dart';
import 'package:polygonid_flutter_sdk/proof/domain/entities/credential_proof_entity.dart';
import 'package:polygonid_flutter_sdk/sdk/credential.dart';

import '../../../common/domain/domain_logger.dart';
import '../../../common/domain/use_case.dart';
import '../../../iden3comm/domain/entities/jwz_proof_entity.dart';
import '../../../identity/domain/entities/did_entity.dart';
import '../../../identity/domain/entities/identity_entity.dart';
import '../../../identity/domain/entities/node_entity.dart';
import '../../../identity/domain/use_cases/sign_message_use_case.dart';
import '../entities/circuit_data_entity.dart';
import '../entities/gist_proof_entity.dart';
import '../entities/jwz/jwz_proof.dart';
import '../entities/proof_entity.dart';
import '../repositories/proof_repository.dart';
import 'get_gist_proof_use_case.dart';
import 'get_credential_proof_use_case.dart';
import 'prove_use_case.dart';

class GenerateProofParam {
  final String did;
  final int profileNonce;
  final int claimSubjectProfileNonce;
  final ClaimEntity credential;
  final ProofScopeRequest request; //FIXME: this is not from proof
  final CircuitDataEntity circuitData;

  /// FIXME: remove nullables
  final String privateKey;
  final String? challenge;

  GenerateProofParam(
      this.did,
      this.profileNonce,
      this.claimSubjectProfileNonce,
      this.credential,
      this.request,
      this.circuitData,
      this.privateKey,
      this.challenge);
}

class GenerateIDParam {
  final String did;
  final String privateKey;

  GenerateIDParam(this.did, this.privateKey);
}

class GenerateProofUseCase extends FutureUseCase<GenerateProofParam, JWZProof> {
  final IdentityRepository _identityRepository;
  final SMTRepository _smtRepository;
  final ProofRepository _proofRepository;
  final ProveUseCase _proveUseCase;
  final GetIdentityUseCase _getIdentityUseCase;
  final GetAuthClaimUseCase _getAuthClaimUseCase;
  final GetGistProofUseCase _getGistProofUseCase;
  final GetCredentialProofUseCase _getCredentialProofUseCase;
  final GetDidUseCase _getDidUseCase;
  final SignMessageUseCase _signMessageUseCase;
  final GetLatestStateUseCase _getLatestStateUseCase;

  GenerateProofUseCase(
    this._identityRepository,
    this._smtRepository,
    this._proofRepository,
    this._proveUseCase,
    this._getIdentityUseCase,
    this._getAuthClaimUseCase,
    this._getGistProofUseCase,
    this._getCredentialProofUseCase,
    this._getDidUseCase,
    this._signMessageUseCase,
    this._getLatestStateUseCase,
  );

  @override
  Future<JWZProof> execute({required GenerateProofParam param}) async {
    List<String>? authClaim;
    ProofEntity? incProof;
    ProofEntity? nonRevProof;
    GistProofEntity? gistProof;
    CredentialProofEntity? credentialProof;
    Map<String, dynamic>? treeState;
    String? signature;
    logger().i("CIRCUIT ID ${param.request.circuitId}");
    // IdentityEntity identity = await _getIdentityUseCase.execute(
    //     param: GetIdentityParam(
    //         genesisDid: param.did, privateKey: param.privateKey));
    // authClaim = await _getAuthClaimUseCase.execute(param: identity.publicKey);
    // NodeEntity authClaimNode =
    //     await _identityRepository.getAuthClaimNode(children: authClaim);

    // incProof = await _smtRepository.generateProof(
    //     key: authClaimNode.hash,
    //     type: TreeType.claims,
    //     did: param.did,
    //     privateKey: param.privateKey!);

    // nonRevProof = await _smtRepository.generateProof(
    //     key: authClaimNode.hash,
    //     type: TreeType.revocation,
    //     did: param.did,
    //     privateKey: param.privateKey!);

    // hash of clatr, revtr, rootr
    // treeState = await _getLatestStateUseCase.execute(
    //     param: GetLatestStateParam(
    //         did: param.did, privateKey: param.privateKey!));

    //gistProof = await _getGistProofUseCase.execute(param: param.did);

    logger().i("GENERATE PROOF PARAMS $param");
    var bytes = utf8.encode(param.privateKey); // data being hashed

    String digestPrivateKey = sha256.convert(bytes).toString();

    logger().i("HASHED: $digestPrivateKey");

    credentialProof =
        await _getCredentialProofUseCase.execute(param: param.did);

    // signature = await _signMessageUseCase.execute(
    //     param: SignMessageParam(param.privateKey!, param.challenge!));

    logger().i("Credential proof $credentialProof");
    //DidEntity didEntity = await _getDidUseCase.execute(param: param.did);

    // Prepare atomic query inputs
    // Uint8List atomicQueryInputs = await _proofRepository
    //     .calculateAtomicQueryInputs(
    //   id: didEntity.identifier,
    //   profileNonce: param.profileNonce,
    //   claimSubjectProfileNonce: param.claimSubjectProfileNonce,
    //   authClaim: authClaim,
    //   incProof: incProof,
    //   nonRevProof: nonRevProof,
    //   gistProof: gistProof,
    //   credentialProof: credentialProof,
    //   treeState: treeState,
    //   challenge: param.challenge,
    //   signature: signature,
    //   claim: param.credential,
    //   request: param.request,
    // )
    //     .catchError((error) {
    //   logger().e("[GenerateProofUseCase] Error: $error");

    //   throw error;
    // });

    // logger().i("Atomic input $atomicQueryInputs");

    // // Prove
    // return _proveUseCase
    //     .execute(param: ProveParam(atomicQueryInputs, param.circuitData))
    //     .then((proof) {
    //   logger().i("[GenerateProofUseCase] proof: $proof");

    //   return proof;
    // }).catchError((error) {
    //   logger().e("[GenerateProofUseCase] Error: $error");

    //   throw error;
    // });
    JWZProofEntity jwzProof = JWZProofEntity(
        id: 1,
        circuitId: "credentialAtomicQuerySigV2OnChain",
        proof: const JWZBaseProof(piA: [
          "2349359218862210199858317711693000258632024139821654419578818717409911103345",
          "9783659542781935947594271195809997372938499745037725231480617782895108798638",
          "1"
        ], piB: [
          [
            "2722574881281545082903602222060947207904770262330936547149603701719115676966",
            "9125080078643389548237112954563029185556286301890398763514523119480036570311"
          ],
          [
            "13640309800784055202696099782919798561985490702663538168219115175849999919373",
            "10363320462296001798560505781397373032943297571589677076420550877863634477652"
          ],
          ["1", "0"]
        ], piC: [
          "19468289507428515297055423521369058514858228111400619397089184798795502030434",
          "6184574667862689946294380001099683927560394818236379313581126620262051325990",
          "1"
        ], protocol: "groth16", curve: ''),
        pubSignals: [
          "16516191222276484743019422039821108870627271580720329599340789241270015286288",
          "378188866234679794171665698554648912262550143866552369147468166902378790912",
          "12975766351353223580809906170006466070394741783925392691515947652647516746182",
          "1",
          "53103020833917443995100151185922895916219347076953603032182812222607392768",
          "15586519700705912779173573830121623565889728172039195968425571091013745698866",
          "1655304049",
          "210459579859058135404770043788028292398",
          "2",
          "2",
          "20000101",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0",
          "0"
        ]);
    return jwzProof;
  }
}
