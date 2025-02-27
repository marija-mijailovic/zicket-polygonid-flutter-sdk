import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:polygonid_flutter_sdk/common/utils/http_exceptions_handler_mixin.dart';

import '../../../common/data/exceptions/network_exceptions.dart';
import '../../../common/domain/domain_logger.dart';
import '../../../credential/data/dtos/claim_dto.dart';
import '../../domain/exceptions/iden3comm_exceptions.dart';
import '../dtos/response/fetch/fetch_claim_response_dto.dart';

class RemoteIden3commDataSource with HttpExceptionsHandlerMixin {
  final Client client;

  RemoteIden3commDataSource(this.client);

  Future<Response> authWithToken({
    required String token,
    required String url,
  }) async {
    return Future.value(Uri.parse(url))
        .then((uri) => client.post(
              uri,
              body: token,
              headers: {
                HttpHeaders.acceptHeader: '*/*',
                HttpHeaders.contentTypeHeader: 'text/plain',
              },
            ))
        .then((response) {
      if (response.statusCode != 200) {
        logger().d(
            'Auth Error: code: ${response.statusCode} msg: ${response.body}');
        throwExceptionOnStatusCode(response.statusCode, response.body);
      }
      return response;
    });
  }

  Future<ClaimDTO> fetchClaim(
      {required String authToken, required String url, required String did}) {
    return Future.value(Uri.parse(url))
        .then((uri) => client.post(
              uri,
              body: authToken,
              headers: {
                HttpHeaders.acceptHeader: '*/*',
                HttpHeaders.contentTypeHeader: 'text/plain',
              },
            ))
        .then((response) async {
      if (response.statusCode == 200) {
        FetchClaimResponseDTO fetchResponse =
            FetchClaimResponseDTO.fromJson(json.decode(response.body));

        if (fetchResponse.type == FetchClaimResponseType.issuance) {
          return ClaimDTO(
              id: fetchResponse.credential.id,
              issuer: fetchResponse.from,
              did: did,
              type: fetchResponse.credential.credentialSubject.type,
              expiration: fetchResponse.credential.expirationDate,
              info: fetchResponse.credential);
        } else {
          throw UnsupportedFetchClaimTypeException(response);
        }
      } else {
        logger().d(
            'fetchClaim Error: code: ${response.statusCode} msg: ${response.body}');
        throw NetworkException(response);
      }
    });
  }

  Future<Map<String, dynamic>> fetchSchema({required String url}) async {
    try {
      String schemaUrl = url;

      if (schemaUrl.toLowerCase().startsWith("ipfs://")) {
        String fileHash = schemaUrl.toLowerCase().replaceFirst("ipfs://", "");
        schemaUrl = "https://ipfs.io/ipfs/$fileHash";
      }

      var schemaUri = Uri.parse(schemaUrl);
      var schemaResponse = await get(schemaUri);
      if (schemaResponse.statusCode == 200) {
        Map<String, dynamic> schema = json.decode(schemaResponse.body);
        logger().d('schema: $schema');

        return schema;
      } else {
        throw NetworkException(schemaResponse);
      }
    } catch (error) {
      logger().e('schema error: $error');
      throw FetchSchemaException(error);
    }
  }

  Future<Map<String, dynamic>> fetchVocab(
      {required Map<String, dynamic> schema, required String type}) async {
    try {
      Map<String, dynamic>? schemaContext;
      if (schema['@context'] is List) {
        schemaContext = schema['@context'].first;
      } else if (schema['@context'] is Map) {
        schemaContext = schema['@context'];
      }

      if (schemaContext != null &&
          schemaContext[type]["@context"]["poly-vocab"] != null) {
        String vocabId = schemaContext[type]["@context"]["poly-vocab"];
        String vocabUrl = vocabId;
        if (vocabId.toLowerCase().startsWith("ipfs://")) {
          String vocabHash = vocabId.toLowerCase().replaceFirst("ipfs://", "");
          vocabUrl = "https://ipfs.io/ipfs/$vocabHash";
        }
        var vocabUri = Uri.parse(vocabUrl);
        var vocabResponse = await client.get(vocabUri, headers: {
          HttpHeaders.acceptHeader: '*/*',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
        if (vocabResponse.statusCode == 200) {
          Map<String, dynamic> vocab = json.decode(vocabResponse.body);
          logger().d('vocab: $vocab');

          return vocab;
        } else {
          throw NetworkException(vocabResponse);
        }
      } else {
        throw UnsupportedSchemaFetchVocabException(schema);
      }
    } catch (error) {
      logger().e('vocab error: $error');
      throw FetchVocabException(error);
    }
  }
}
