import '../../../../common/domain/error_exception.dart';

class IdentityException extends ErrorException {
  IdentityException(error) : super(error);
}

class TooLongPrivateKeyException implements Exception {}

class IdentityAlreadyExistsException implements Exception {
  final String did;

  IdentityAlreadyExistsException(this.did);
}

class UnknownIdentityException implements Exception {
  final String did;

  UnknownIdentityException(this.did);
}

class InvalidPrivateKeyException implements Exception {
  final String privateKey;

  InvalidPrivateKeyException(this.privateKey);
}

class FetchIdentityStateException extends ErrorException {
  FetchIdentityStateException(error) : super(error);
}

class FetchStateRootsException extends ErrorException {
  FetchStateRootsException(error) : super(error);
}

class NonRevProofException extends ErrorException {
  NonRevProofException(error) : super(error);
}
