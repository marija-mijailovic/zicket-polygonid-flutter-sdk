import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:polygonid_flutter_sdk/common/domain/domain_logger.dart';
import 'package:polygonid_flutter_sdk/sdk/mappers/iden3_message_type_mapper.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
import 'package:polygonid_flutter_sdk_example/src/common/app_logger.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/auth/auth_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/backup_identity/bloc/backup_identity_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/check_identity_validity/bloc/check_identity_validity_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/claim_detail/bloc/claim_detail_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/claims/claims_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/claims/mappers/claim_model_mapper.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/claims/mappers/claim_model_state_mapper.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/claims/mappers/proof_model_type_mapper.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/home/home_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/restore_identity/bloc/restore_identity_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/sign/sign_bloc.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/ui/splash/splash_bloc.dart';

final getIt = GetIt.instance;

/// Dependency Injection initializer
Future<void> init() async {
  await registerProviders();
  registerSplashDependencies();
  registerHomeDependencies();
  registerClaimDetailDependencies();
  registerClaimsDependencies();
  registerAuthDependencies();
  registerMappers();
  registerSignDependencies();
  registerIdentityDependencies();
  registerBackupIdentityDependencies();
  registerRestoreIdentityDependencies();
}

///
Future<void> registerProviders() async {
  await PolygonIdSdk.init();
  getIt.registerLazySingleton<PolygonIdSdk>(() => PolygonIdSdk.I);
  getIt.registerLazySingleton<Logger>(() => Logger());
  getIt.registerLazySingleton<DomainLogger>(() => AppLogger(getIt()));
  Domain.logger = getIt<DomainLogger>();
}

///
void registerSplashDependencies() {
  getIt.registerFactory(() => SplashBloc());
}

///
void registerHomeDependencies() {
  getIt.registerFactory(() => HomeBloc(getIt()));
}

///
void registerClaimsDependencies() {
  getIt.registerFactory(() => ClaimsBloc(getIt(), getIt()));
}

///
void registerClaimDetailDependencies() {
  getIt.registerFactory(() => ClaimDetailBloc(getIt()));
}

///
void registerAuthDependencies() {
  getIt.registerFactory(() => AuthBloc(getIt()));
}

///
void registerMappers() {
  getIt.registerFactory(() => ClaimModelMapper(getIt(), getIt()));
  getIt.registerFactory(() => ClaimModelStateMapper());
  getIt.registerFactory(() => ProofModelTypeMapper());
  getIt.registerFactory(() => Iden3MessageTypeMapper());
}

///
void registerSignDependencies() {
  getIt.registerFactory(() => SignBloc(getIt()));
}

///
void registerIdentityDependencies() {
  getIt.registerFactory<CheckIdentityValidityBloc>(
      () => CheckIdentityValidityBloc(getIt()));
}

///
void registerBackupIdentityDependencies() {
  getIt.registerFactory<BackupIdentityBloc>(() => BackupIdentityBloc(getIt()));
}

///
void registerRestoreIdentityDependencies() {
  getIt
      .registerFactory<RestoreIdentityBloc>(() => RestoreIdentityBloc(getIt()));
}
