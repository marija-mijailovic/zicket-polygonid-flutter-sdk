import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
import 'package:polygonid_flutter_sdk_example/src/data/secure_storage.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/restore_identity/bloc/restore_identity_event.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/restore_identity/bloc/restore_identity_state.dart';
import 'package:polygonid_flutter_sdk_example/utils/secure_storage_keys.dart';

class RestoreIdentityBloc
    extends Bloc<RestoreIdentityEvent, RestoreIdentityState> {
  final PolygonIdSdk _polygonIdSdk;

  RestoreIdentityBloc(this._polygonIdSdk)
      : super(const RestoreIdentityState.initial()) {
    on<RestoreIdentityEvent>(_handleRestoreIdentity);
  }

  ///
  Future<void> _handleRestoreIdentity(
    RestoreIdentityEvent event,
    Emitter<RestoreIdentityState> emit,
  ) async {
    emit(const RestoreIdentityState.loading());

    // Get private key from secure storage
    String? privateKey =
        await SecureStorage.read(key: SecureStorageKeys.privateKey);

    // Check if private key is null otherwise emit error
    if (privateKey == null) {
      emit(const RestoreIdentityState.error('Private key not found'));
      return;
    }

    // Get backup from secure storage
    String? backup = await SecureStorage.read(key: SecureStorageKeys.backupKey);
    // Check if backup is null otherwise emit error
    if (backup == null) {
      emit(const RestoreIdentityState.error('Backup not found'));
      return;
    }

    try {
      // restore identity
      await _polygonIdSdk.identity.restoreIdentity(
        privateKey: privateKey,
        encryptedIdentityDbs: {0: backup},
        blockchain: "polygon",
        network: "mumbai",
      );

      // emit success state
      emit(const RestoreIdentityState.success());
    } catch (e) {
      // emit error state
      emit(RestoreIdentityState.error(e.toString()));
    }
  }
}
