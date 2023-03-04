import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:polygonid_flutter_sdk/common/domain/domain_logger.dart';
import 'package:polygonid_flutter_sdk/common/utils/uint8_list_utils.dart';
import 'package:polygonid_flutter_sdk/assets/state.g.dart';
import 'package:polygonid_flutter_sdk/assets/credentialVerifiable.g.dart';
import 'package:polygonid_flutter_sdk/credential/domain/entities/claim_entity.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/jwz_proof_entity.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../../../common/domain/use_cases/get_config_use_case.dart';

class RPCDataSource {
  final Web3Client web3Client;

  RPCDataSource(this.web3Client);

  /// Retrieve last state for a given identity.
  ///
  /// @param [id] identity - The base58 identifier string
  /// @param [stateContract] the ABI contract
  ///
  /// @returns [String] last state committed
  Future<String> getState(String id, DeployedContract stateContract) async {
    try {
      var state = State(address: stateContract.address, client: web3Client);
      BigInt idBigInt = Uint8ArrayUtils.leBuff2int(hexToBytes(id));
      logger().d(idBigInt);

      List<dynamic> result = await state.getStateInfoById(idBigInt);

      if (result != null &&
          result.isNotEmpty &&
          result.length == 7 &&
          result[1] is BigInt) {
        if (result[1] != BigInt.zero) {
          // state
          String resultString =
              bytesToHex(Uint8ArrayUtils.bigIntToBytes(result[1]));
          logger().d(resultString);
          return resultString;
        }
      }
      return "";
    } catch (e) {
      logger().e(e.toString());
      rethrow;
    }
  }

  /// Retrieve gist proof.
  ///
  /// @param [id] identity - The id as bigint
  /// @param [contract] the ABI contract
  ///
  /// @returns [String] proof
  Future<String> getCredentialProof(
      String id, DeployedContract contract) async {
    logger().i("WOHOOOOO ${contract.address}, id ${id}");

    try {
      var credentialVerifiable =
          CredentialVerifiable(address: contract.address, client: web3Client);

      List<BigInt> inputs = [
        BigInt.parse("1"),
        BigInt.parse(
            "23148815156036415257880629805918280289521283545914987650593028688906359298"),
        BigInt.parse(
            "918395054767011677585222968951431673317019980899872578960405718581010976201"),
        BigInt.parse(
            "17331355254492292023888705817530937282445011806302834549270724974470639299870"),
        BigInt.parse("1"),
        BigInt.parse("7425539433426587031333504468497519265437533827"),
        BigInt.parse(
            "19129906263061542836523076712182691581312942415943971939126630612030252511196"),
        BigInt.parse(
            "25233817673139721319711173170660765293171257314049494562316310278052385282"),
        BigInt.parse("1"),
        BigInt.parse(
            "15404100832747310717156525831900273905436093733598685887475101647896495753782"),
        BigInt.parse("1677636553")
      ];
      List<BigInt> a = [
        // BigInt.parse(
        //     "15315746327357883586097266285711368117689572114165777247256736906730337723610"),
        BigInt.parse(
            "15561695241533746040550275836174600257244389332448866633954418498908055008082")
      ];
      List<List<BigInt>> b = [
        [
          BigInt.parse(
              "6078675217137702817623112742371806982888878997432796588024516323289132329402")
        ],
        [
          BigInt.parse(
              "17151388908048117652493299620847063154296880970082258837144045518884510858174")
        ]
      ];
      Map<EthPrivateKey, EthPrivateKey> map = {};
      final credentials =
          EthPrivateKey.fromHex(PolygonIdConfig.credentialsKey as String);

      var bytes = utf8.encode(id);
      String digiest = sha256.convert(bytes).toString();
      logger().i(digiest);

      await credentialVerifiable.userVerification(
          BigInt.one, [id, digiest], BigInt.one, inputs,
          credentials: credentials);

      return "{ok}";
    } catch (e) {
      logger().e(e.toString());
      rethrow;
    }
  }

  /// Retrieve gist proof.
  ///
  /// @param [id] identity - The id as bigint
  /// @param [gistContract] the ABI contract
  ///
  /// @returns [String] gist proof
  Future<String> getGistProof(String id, DeployedContract gistContract) async {
    try {
      /// TODO: replace to autegenerated code to interact with SC
      //var state = State(address: gistContract.address, client: web3Client);
      //dynamic res = await state.getGISTProof(BigInt.parse(id));
      final transactionParameters = [
        BigInt.parse(id),
      ];

      logger().d(transactionParameters);

      List<dynamic> result;

      result = await web3Client.call(
          contract: gistContract,
          function: _getGistProof(gistContract),
          params: transactionParameters);

      if (result != null &&
          result.isNotEmpty &&
          result[0] is List &&
          result[0].length == 8) {
        var siblings =
            (result[0][2] as List).map((bigInt) => bigInt.toString()).toList();

        final String resultString = jsonEncode({
          "root": result[0][0].toString(),
          "existence": result[0][1].toString() == "true" ? true : false,
          "siblings": siblings,
          "index": result[0][3].toString(),
          "value": result[0][4].toString(),
          "auxExistence": result[0][5].toString() == "true" ? true : false,
          "auxIndex": result[0][6].toString(),
          "auxValue": result[0][7].toString(),
        });
        logger().d(resultString);
        return resultString;
      }
      return "";
    } catch (e) {
      logger().e(e.toString());
      rethrow;
    }
  }

  ContractFunction _getGistProof(DeployedContract contract) =>
      contract.function('getGISTProof');
}
