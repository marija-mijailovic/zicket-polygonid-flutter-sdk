import 'package:bloc/bloc.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/iden3_message_entity.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
import 'package:polygonid_flutter_sdk_example/src/data/secure_storage.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/auth/auth_event.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/auth/auth_state.dart';
import 'package:polygonid_flutter_sdk_example/utils/secure_storage_keys.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PolygonIdSdk _polygonIdSdk;

  AuthBloc(this._polygonIdSdk) : super(const AuthState.initial()) {
    on<ClickScanQrCodeEvent>(_handleClickScanQrCode);
    on<ScanQrCodeResponse>(_handleScanQrCodeResponse);
  }

  ///
  void _handleClickScanQrCode(
      ClickScanQrCodeEvent event, Emitter<AuthState> emit) {
    emit(const AuthState.navigateToQrCodeScanner());
  }

  ///
  Future<void> _handleScanQrCodeResponse(
      ScanQrCodeResponse event, Emitter<AuthState> emit) async {
    String? qrCodeResponse = event.response;
    if (qrCodeResponse == null || qrCodeResponse.isEmpty) {
      emit(const AuthState.error("no qr code scanned"));
      return;
    }

    try {
      final Iden3MessageEntity iden3message = await _polygonIdSdk.iden3comm
          .getIden3Message(message: qrCodeResponse);
      emit(AuthState.loaded(iden3message));

      String? privateKey =
          await SecureStorage.read(key: SecureStorageKeys.privateKey);

      if (privateKey == null) {
        emit(const AuthState.error("no private key found"));
        return;
      }

      await _authenticate(
        iden3message: iden3message,
        privateKey: privateKey,
        emit: emit,
      );
    } catch (error) {
      emit(const AuthState.error("Scanned code is not valid"));
    }
  }

  ///
  Future<void> _authenticate({
    required Iden3MessageEntity iden3message,
    required String privateKey,
    required Emitter<AuthState> emit,
  }) async {
    emit(const AuthState.loading());
    String? did = await _polygonIdSdk.identity.getDidIdentifier(
        privateKey: privateKey, blockchain: 'polygon', network: 'mumbai');

    if (did == null) {
      emit(const AuthState.error(
          "an identity is needed before trying to authenticate"));
      return;
    }

    try {
      await _polygonIdSdk.iden3comm.authenticate(
        message: iden3message,
        did: did,
        privateKey: privateKey,
      );

      emit(const AuthState.authenticated());
    } catch (error) {
      emit(AuthState.error(error.toString()));
    }
  }
}
