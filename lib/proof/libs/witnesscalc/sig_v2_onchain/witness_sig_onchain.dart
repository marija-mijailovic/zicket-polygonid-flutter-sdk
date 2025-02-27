import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'native_witness_sig_v2_onchain.dart';

@injectable
class WitnessSigV2OnchainLib {
  static NativeWitnessSigOnchainLib get _nativeWitnessSigV2OnchainLib {
    return Platform.isAndroid
        ? NativeWitnessSigOnchainLib(ffi.DynamicLibrary.open(
            "libwitnesscalc_credentialAtomicQuerySigV2OnChain.so"))
        : NativeWitnessSigOnchainLib(ffi.DynamicLibrary.process());
  }

  WitnessSigV2OnchainLib();

  Future<Uint8List?> calculateWitnessSigOnchain(
      Uint8List wasmBytes, Uint8List inputsJsonBytes) async {
    int circuitSize = wasmBytes.length;
    ffi.Pointer<ffi.Char> circuitBuffer = malloc<ffi.Char>(circuitSize);
    final data = wasmBytes;
    for (int i = 0; i < circuitSize; i++) {
      circuitBuffer[i] = data[i];
    }

    int jsonSize = inputsJsonBytes.length;
    ffi.Pointer<ffi.Char> jsonBuffer = malloc<ffi.Char>(jsonSize);
    final data2 = inputsJsonBytes;
    for (int i = 0; i < jsonSize; i++) {
      jsonBuffer[i] = data2[i];
    }

    ffi.Pointer<ffi.UnsignedLong> wtnsSize = malloc<ffi.UnsignedLong>();
    wtnsSize.value = 4 * 1024 * 1024;
    ffi.Pointer<ffi.Char> wtnsBuffer = malloc<ffi.Char>(wtnsSize.value);

    int errorMaxSize = 256;
    ffi.Pointer<ffi.Char> errorMsg = malloc<ffi.Char>(errorMaxSize);

    int result = _nativeWitnessSigV2OnchainLib
        .witnesscalc_credentialAtomicQuerySigV2OnChain(
            circuitBuffer,
            circuitSize,
            jsonBuffer,
            jsonSize,
            wtnsBuffer,
            wtnsSize,
            errorMsg,
            errorMaxSize);
    if (result == WITNESSCALC_OK) {
      Uint8List wtnsBytes = Uint8List(wtnsSize.value);
      for (int i = 0; i < wtnsSize.value; i++) {
        wtnsBytes[i] = wtnsBuffer[i];
      }
      return wtnsBytes;
    } else if (result == WITNESSCALC_ERROR) {
      ffi.Pointer<Utf8> jsonString = errorMsg.cast<Utf8>();
      String errormsg = jsonString.toDartString();
      if (kDebugMode) {
        print("$result: ${result.toString()}. Error: $errormsg");
      }
    } else if (result == WITNESSCALC_ERROR_SHORT_BUFFER) {
      if (kDebugMode) {
        print(
            "$result: ${result.toString()}. Error: Short buffer for proof or public");
      }
    }
    return null;
  }
}
