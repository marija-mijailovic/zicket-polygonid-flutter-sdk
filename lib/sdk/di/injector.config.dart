// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:archive/archive.dart' as _i71;
import 'package:encrypt/encrypt.dart' as _i14;
import 'package:flutter/services.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i38;
import 'package:sembast/sembast.dart' as _i13;
import 'package:web3dart/web3dart.dart' as _i64;

import '../../common/data/data_sources/env_datasource.dart' as _i77;
import '../../common/data/data_sources/package_info_datasource.dart' as _i39;
import '../../common/data/repositories/env_config_repository_impl.dart' as _i93;
import '../../common/data/repositories/package_info_repository_impl.dart'
    as _i40;
import '../../common/domain/repositories/config_repository.dart' as _i102;
import '../../common/domain/repositories/package_info_repository.dart' as _i90;
import '../../common/domain/use_cases/get_config_use_case.dart' as _i106;
import '../../common/domain/use_cases/get_package_name_use_case.dart' as _i95;
import '../../common/libs/polygonidcore/pidcore_base.dart' as _i41;
import '../../credential/data/credential_repository_impl.dart' as _i94;
import '../../credential/data/data_sources/lib_pidcore_credential_data_source.dart'
    as _i84;
import '../../credential/data/data_sources/local_claim_data_source.dart'
    as _i88;
import '../../credential/data/data_sources/remote_claim_data_source.dart'
    as _i54;
import '../../credential/data/data_sources/storage_claim_data_source.dart'
    as _i74;
import '../../credential/data/mappers/claim_info_mapper.dart' as _i9;
import '../../credential/data/mappers/claim_mapper.dart' as _i73;
import '../../credential/data/mappers/claim_state_mapper.dart' as _i10;
import '../../credential/data/mappers/filter_mapper.dart' as _i17;
import '../../credential/data/mappers/filters_mapper.dart' as _i18;
import '../../credential/data/mappers/id_filter_mapper.dart' as _i26;
import '../../credential/data/mappers/revocation_status_mapper.dart' as _i57;
import '../../credential/domain/repositories/credential_repository.dart'
    as _i103;
import '../../credential/domain/use_cases/get_auth_claim_use_case.dart'
    as _i104;
import '../../credential/domain/use_cases/get_claim_revocation_status_use_case.dart'
    as _i136;
import '../../credential/domain/use_cases/get_claims_use_case.dart' as _i105;
import '../../credential/domain/use_cases/remove_all_claims_use_case.dart'
    as _i113;
import '../../credential/domain/use_cases/remove_claims_use_case.dart' as _i114;
import '../../credential/domain/use_cases/save_claims_use_case.dart' as _i153;
import '../../credential/domain/use_cases/update_claim_use_case.dart' as _i117;
import '../../credential/libs/polygonidcore/pidcore_credential.dart' as _i42;
import '../../env/sdk_env.dart' as _i59;
import '../../iden3comm/data/data_sources/lib_pidcore_iden3comm_data_source.dart'
    as _i85;
import '../../iden3comm/data/data_sources/remote_iden3comm_data_source.dart'
    as _i55;
import '../../iden3comm/data/mappers/auth_inputs_mapper.dart' as _i4;
import '../../iden3comm/data/mappers/auth_proof_mapper.dart' as _i72;
import '../../iden3comm/data/mappers/auth_response_mapper.dart' as _i5;
import '../../iden3comm/data/mappers/credential_proof_mapper.dart' as _i75;
import '../../iden3comm/data/mappers/gist_proof_mapper.dart' as _i79;
import '../../iden3comm/data/mappers/proof_request_filters_mapper.dart' as _i50;
import '../../iden3comm/data/repositories/iden3comm_credential_repository_impl.dart'
    as _i80;
import '../../iden3comm/data/repositories/iden3comm_repository_impl.dart'
    as _i97;
import '../../iden3comm/domain/repositories/iden3comm_credential_repository.dart'
    as _i96;
import '../../iden3comm/domain/repositories/iden3comm_repository.dart' as _i108;
import '../../iden3comm/domain/use_cases/authenticate_use_case.dart' as _i157;
import '../../iden3comm/domain/use_cases/fetch_and_save_claims_use_case.dart'
    as _i160;
import '../../iden3comm/domain/use_cases/get_auth_challenge_use_case.dart'
    as _i122;
import '../../iden3comm/domain/use_cases/get_auth_inputs_use_case.dart'
    as _i149;
import '../../iden3comm/domain/use_cases/get_auth_token_use_case.dart' as _i150;
import '../../iden3comm/domain/use_cases/get_fetch_requests_use_case.dart'
    as _i19;
import '../../iden3comm/domain/use_cases/get_filters_use_case.dart' as _i138;
import '../../iden3comm/domain/use_cases/get_iden3comm_claims_use_case.dart'
    as _i140;
import '../../iden3comm/domain/use_cases/get_iden3comm_proofs_use_case.dart'
    as _i151;
import '../../iden3comm/domain/use_cases/get_iden3message_type_use_case.dart'
    as _i20;
import '../../iden3comm/domain/use_cases/get_iden3message_use_case.dart'
    as _i21;
import '../../iden3comm/domain/use_cases/get_proof_query_use_case.dart' as _i22;
import '../../iden3comm/domain/use_cases/get_proof_requests_use_case.dart'
    as _i23;
import '../../iden3comm/domain/use_cases/get_vocabs_use_case.dart' as _i107;
import '../../iden3comm/libs/polygonidcore/pidcore_iden3comm.dart' as _i43;
import '../../identity/data/data_sources/db_destination_path_data_source.dart'
    as _i12;
import '../../identity/data/data_sources/encryption_db_data_source.dart'
    as _i15;
import '../../identity/data/data_sources/lib_babyjubjub_data_source.dart'
    as _i31;
import '../../identity/data/data_sources/lib_pidcore_identity_data_source.dart'
    as _i86;
import '../../identity/data/data_sources/local_contract_files_data_source.dart'
    as _i32;
import '../../identity/data/data_sources/remote_identity_data_source.dart'
    as _i56;
import '../../identity/data/data_sources/rpc_data_source.dart' as _i91;
import '../../identity/data/data_sources/smt_data_source.dart' as _i100;
import '../../identity/data/data_sources/storage_identity_data_source.dart'
    as _i82;
import '../../identity/data/data_sources/storage_key_value_data_source.dart'
    as _i83;
import '../../identity/data/data_sources/storage_smt_data_source.dart' as _i81;
import '../../identity/data/data_sources/wallet_data_source.dart' as _i63;
import '../../identity/data/mappers/encryption_key_mapper.dart' as _i16;
import '../../identity/data/mappers/hash_mapper.dart' as _i24;
import '../../identity/data/mappers/hex_mapper.dart' as _i25;
import '../../identity/data/mappers/identity_dto_mapper.dart' as _i28;
import '../../identity/data/mappers/node_mapper.dart' as _i89;
import '../../identity/data/mappers/node_type_dto_mapper.dart' as _i35;
import '../../identity/data/mappers/node_type_entity_mapper.dart' as _i36;
import '../../identity/data/mappers/node_type_mapper.dart' as _i37;
import '../../identity/data/mappers/poseidon_hash_mapper.dart' as _i46;
import '../../identity/data/mappers/private_key_mapper.dart' as _i47;
import '../../identity/data/mappers/q_mapper.dart' as _i53;
import '../../identity/data/mappers/rhs_node_mapper.dart' as _i92;
import '../../identity/data/mappers/rhs_node_type_mapper.dart' as _i58;
import '../../identity/data/mappers/state_identifier_mapper.dart' as _i60;
import '../../identity/data/mappers/tree_state_mapper.dart' as _i61;
import '../../identity/data/mappers/tree_type_mapper.dart' as _i62;
import '../../identity/data/repositories/identity_repository_impl.dart' as _i98;
import '../../identity/data/repositories/smt_repository_impl.dart' as _i101;
import '../../identity/domain/repositories/identity_repository.dart' as _i109;
import '../../identity/domain/repositories/smt_repository.dart' as _i115;
import '../../identity/domain/use_cases/add_identity_use_case.dart' as _i155;
import '../../identity/domain/use_cases/add_profile_use_case.dart' as _i156;
import '../../identity/domain/use_cases/backup_identity_use_case.dart' as _i145;
import '../../identity/domain/use_cases/check_identity_validity_use_case.dart'
    as _i146;
import '../../identity/domain/use_cases/create_identity_state_use_case.dart'
    as _i133;
import '../../identity/domain/use_cases/create_identity_use_case.dart' as _i147;
import '../../identity/domain/use_cases/create_new_identity_use_case.dart'
    as _i158;
import '../../identity/domain/use_cases/export_identity_use_case.dart' as _i120;
import '../../identity/domain/use_cases/fetch_identity_state_use_case.dart'
    as _i134;
import '../../identity/domain/use_cases/fetch_state_roots_use_case.dart'
    as _i121;
import '../../identity/domain/use_cases/generate_non_rev_proof_use_case.dart'
    as _i135;
import '../../identity/domain/use_cases/get_did_identifier_use_case.dart'
    as _i141;
import '../../identity/domain/use_cases/get_did_use_case.dart' as _i123;
import '../../identity/domain/use_cases/get_genesis_state_use_case.dart'
    as _i139;
import '../../identity/domain/use_cases/get_identities_use_case.dart' as _i125;
import '../../identity/domain/use_cases/get_identity_auth_claim_use_case.dart'
    as _i126;
import '../../identity/domain/use_cases/get_identity_use_case.dart' as _i142;
import '../../identity/domain/use_cases/get_latest_state_use_case.dart'
    as _i128;
import '../../identity/domain/use_cases/get_profiles_use_case.dart' as _i143;
import '../../identity/domain/use_cases/get_public_keys_use_case.dart' as _i129;
import '../../identity/domain/use_cases/import_identity_use_case.dart' as _i110;
import '../../identity/domain/use_cases/remove_identity_state_use_case.dart'
    as _i132;
import '../../identity/domain/use_cases/remove_identity_use_case.dart' as _i144;
import '../../identity/domain/use_cases/remove_profile_use_case.dart' as _i162;
import '../../identity/domain/use_cases/restore_identity_use_case.dart'
    as _i163;
import '../../identity/domain/use_cases/sign_message_use_case.dart' as _i116;
import '../../identity/domain/use_cases/update_identity_use_case.dart' as _i154;
import '../../identity/libs/bjj/bjj.dart' as _i6;
import '../../identity/libs/polygonidcore/pidcore_identity.dart' as _i44;
import '../../proof/data/data_sources/circuits_download_data_source.dart'
    as _i8;
import '../../proof/data/data_sources/lib_pidcore_proof_data_source.dart'
    as _i87;
import '../../proof/data/data_sources/local_proof_files_data_source.dart'
    as _i33;
import '../../proof/data/data_sources/proof_circuit_data_source.dart' as _i48;
import '../../proof/data/data_sources/prover_lib_data_source.dart' as _i52;
import '../../proof/data/data_sources/witness_data_source.dart' as _i66;
import '../../proof/data/mappers/circuit_type_mapper.dart' as _i7;
import '../../proof/data/mappers/credential_proof_mapper.dart' as _i76;
import '../../proof/data/mappers/gist_proof_mapper.dart' as _i78;
import '../../proof/data/mappers/jwz_mapper.dart' as _i29;
import '../../proof/data/mappers/jwz_proof_mapper.dart' as _i30;
import '../../proof/data/mappers/node_aux_mapper.dart' as _i34;
import '../../proof/data/mappers/proof_mapper.dart' as _i49;
import '../../proof/data/repositories/proof_repository_impl.dart' as _i99;
import '../../proof/domain/repositories/proof_repository.dart' as _i111;
import '../../proof/domain/use_cases/circuits_files_exist_use_case.dart'
    as _i118;
import '../../proof/domain/use_cases/download_circuits_use_case.dart' as _i119;
import '../../proof/domain/use_cases/generate_proof_use_case.dart' as _i148;
import '../../proof/domain/use_cases/get_credential_proof_use_case.dart'
    as _i137;
import '../../proof/domain/use_cases/get_gist_proof_use_case.dart' as _i124;
import '../../proof/domain/use_cases/get_jwz_use_case.dart' as _i127;
import '../../proof/domain/use_cases/is_proof_circuit_supported_use_case.dart'
    as _i130;
import '../../proof/domain/use_cases/load_circuit_use_case.dart' as _i131;
import '../../proof/domain/use_cases/prove_use_case.dart' as _i112;
import '../../proof/libs/polygonidcore/pidcore_proof.dart' as _i45;
import '../../proof/libs/prover/prover.dart' as _i51;
import '../../proof/libs/witnesscalc/auth_v2/witness_auth.dart' as _i65;
import '../../proof/libs/witnesscalc/mtp_v2/witness_mtp.dart' as _i67;
import '../../proof/libs/witnesscalc/mtp_v2_onchain/witness_mtp_onchain.dart'
    as _i68;
import '../../proof/libs/witnesscalc/sig_v2/witness_sig.dart' as _i69;
import '../../proof/libs/witnesscalc/sig_v2_onchain/witness_sig_onchain.dart'
    as _i70;
import '../credential.dart' as _i159;
import '../iden3comm.dart' as _i161;
import '../identity.dart' as _i164;
import '../mappers/iden3_message_type_mapper.dart' as _i27;
import '../proof.dart' as _i152;
import 'injector.dart' as _i165; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initSDKGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final platformModule = _$PlatformModule();
  final networkModule = _$NetworkModule();
  final databaseModule = _$DatabaseModule();
  final encryptionModule = _$EncryptionModule();
  final sdk = _$Sdk();
  final zipDecoderModule = _$ZipDecoderModule();
  final repositoriesModule = _$RepositoriesModule();
  gh.lazySingleton<_i3.AssetBundle>(() => platformModule.assetBundle);
  gh.factory<_i4.AuthInputsMapper>(() => _i4.AuthInputsMapper());
  gh.factory<_i5.AuthResponseMapper>(() => _i5.AuthResponseMapper());
  gh.factory<_i6.BabyjubjubLib>(() => _i6.BabyjubjubLib());
  gh.factory<_i7.CircuitTypeMapper>(() => _i7.CircuitTypeMapper());
  gh.factory<_i8.CircuitsDownloadDataSource>(
      () => _i8.CircuitsDownloadDataSource());
  gh.factory<_i9.ClaimInfoMapper>(() => _i9.ClaimInfoMapper());
  gh.factory<_i10.ClaimStateMapper>(() => _i10.ClaimStateMapper());
  gh.factory<_i11.Client>(() => networkModule.client);
  gh.factory<_i12.CreatePathWrapper>(() => _i12.CreatePathWrapper());
  gh.factoryParamAsync<_i13.Database, String?, String?>(
    (
      identifier,
      privateKey,
    ) =>
        databaseModule.identityDatabase(
      identifier,
      privateKey,
    ),
    instanceName: 'polygonIdSdkIdentity',
  );
  gh.lazySingletonAsync<_i13.Database>(() => databaseModule.database());
  gh.factory<_i12.DestinationPathDataSource>(
      () => _i12.DestinationPathDataSource(get<_i12.CreatePathWrapper>()));
  gh.factoryParam<_i14.Encrypter, _i14.Key, dynamic>(
    (
      key,
      _,
    ) =>
        encryptionModule.encryptAES(key),
    instanceName: 'encryptAES',
  );
  gh.factory<_i15.EncryptionDbDataSource>(() => _i15.EncryptionDbDataSource());
  gh.factory<_i16.EncryptionKeyMapper>(() => _i16.EncryptionKeyMapper());
  gh.factory<_i17.FilterMapper>(() => _i17.FilterMapper());
  gh.factory<_i18.FiltersMapper>(
      () => _i18.FiltersMapper(get<_i17.FilterMapper>()));
  gh.factory<_i19.GetFetchRequestsUseCase>(
      () => _i19.GetFetchRequestsUseCase());
  gh.factory<_i20.GetIden3MessageTypeUseCase>(
      () => _i20.GetIden3MessageTypeUseCase());
  gh.factory<_i21.GetIden3MessageUseCase>(() =>
      _i21.GetIden3MessageUseCase(get<_i20.GetIden3MessageTypeUseCase>()));
  gh.factory<_i22.GetProofQueryUseCase>(() => _i22.GetProofQueryUseCase());
  gh.factory<_i23.GetProofRequestsUseCase>(
      () => _i23.GetProofRequestsUseCase(get<_i22.GetProofQueryUseCase>()));
  gh.factory<_i24.HashMapper>(() => _i24.HashMapper());
  gh.factory<_i25.HexMapper>(() => _i25.HexMapper());
  gh.factory<_i26.IdFilterMapper>(() => _i26.IdFilterMapper());
  gh.factory<_i27.Iden3MessageTypeMapper>(() => _i27.Iden3MessageTypeMapper());
  gh.factory<_i28.IdentityDTOMapper>(() => _i28.IdentityDTOMapper());
  gh.factory<_i29.JWZMapper>(() => _i29.JWZMapper());
  gh.factory<_i30.JWZProofMapper>(() => _i30.JWZProofMapper());
  gh.factory<_i31.LibBabyJubJubDataSource>(
      () => _i31.LibBabyJubJubDataSource(get<_i6.BabyjubjubLib>()));
  gh.factory<_i32.LocalContractFilesDataSource>(
      () => _i32.LocalContractFilesDataSource(get<_i3.AssetBundle>()));
  gh.factory<_i33.LocalProofFilesDataSource>(
      () => _i33.LocalProofFilesDataSource());
  gh.factory<Map<String, _i13.StoreRef<String, Map<String, Object?>>>>(
    () => databaseModule.securedStore,
    instanceName: 'securedStore',
  );
  gh.factory<_i34.NodeAuxMapper>(() => _i34.NodeAuxMapper());
  gh.factory<_i35.NodeTypeDTOMapper>(() => _i35.NodeTypeDTOMapper());
  gh.factory<_i36.NodeTypeEntityMapper>(() => _i36.NodeTypeEntityMapper());
  gh.factory<_i37.NodeTypeMapper>(() => _i37.NodeTypeMapper());
  gh.lazySingletonAsync<_i38.PackageInfo>(() => platformModule.packageInfo);
  gh.factoryAsync<_i39.PackageInfoDataSource>(() async =>
      _i39.PackageInfoDataSource(await get.getAsync<_i38.PackageInfo>()));
  gh.factoryAsync<_i40.PackageInfoRepositoryImpl>(() async =>
      _i40.PackageInfoRepositoryImpl(
          await get.getAsync<_i39.PackageInfoDataSource>()));
  gh.factory<_i41.PolygonIdCore>(() => _i41.PolygonIdCore());
  gh.factory<_i42.PolygonIdCoreCredential>(
      () => _i42.PolygonIdCoreCredential());
  gh.factory<_i43.PolygonIdCoreIden3comm>(() => _i43.PolygonIdCoreIden3comm());
  gh.factory<_i44.PolygonIdCoreIdentity>(() => _i44.PolygonIdCoreIdentity());
  gh.factory<_i45.PolygonIdCoreProof>(() => _i45.PolygonIdCoreProof());
  gh.factory<_i46.PoseidonHashMapper>(
      () => _i46.PoseidonHashMapper(get<_i25.HexMapper>()));
  gh.factory<_i47.PrivateKeyMapper>(() => _i47.PrivateKeyMapper());
  gh.factory<_i48.ProofCircuitDataSource>(() => _i48.ProofCircuitDataSource());
  gh.factory<_i49.ProofMapper>(() => _i49.ProofMapper(
        get<_i24.HashMapper>(),
        get<_i34.NodeAuxMapper>(),
      ));
  gh.factory<_i50.ProofRequestFiltersMapper>(
      () => _i50.ProofRequestFiltersMapper());
  gh.factory<_i51.ProverLib>(() => _i51.ProverLib());
  gh.factory<_i52.ProverLibWrapper>(() => _i52.ProverLibWrapper());
  gh.factory<_i53.QMapper>(() => _i53.QMapper());
  gh.factory<_i54.RemoteClaimDataSource>(
      () => _i54.RemoteClaimDataSource(get<_i11.Client>()));
  gh.factory<_i55.RemoteIden3commDataSource>(
      () => _i55.RemoteIden3commDataSource(get<_i11.Client>()));
  gh.factory<_i56.RemoteIdentityDataSource>(
      () => _i56.RemoteIdentityDataSource());
  gh.factory<_i57.RevocationStatusMapper>(() => _i57.RevocationStatusMapper());
  gh.factory<_i58.RhsNodeTypeMapper>(() => _i58.RhsNodeTypeMapper());
  gh.lazySingleton<_i59.SdkEnv>(() => sdk.sdkEnv);
  gh.factoryParam<_i13.SembastCodec, String, dynamic>((
    privateKey,
    _,
  ) =>
      databaseModule.getCodec(privateKey));
  gh.factory<_i60.StateIdentifierMapper>(() => _i60.StateIdentifierMapper());
  gh.factory<_i13.StoreRef<String, dynamic>>(
    () => databaseModule.keyValueStore,
    instanceName: 'keyValueStore',
  );
  gh.factory<_i13.StoreRef<String, Map<String, Object?>>>(
    () => databaseModule.identityStore,
    instanceName: 'identityStore',
  );
  gh.factory<String>(
    () => sdk.accessMessage,
    instanceName: 'accessMessage',
  );
  gh.factory<_i61.TreeStateMapper>(() => _i61.TreeStateMapper());
  gh.factory<_i62.TreeTypeMapper>(() => _i62.TreeTypeMapper());
  gh.factory<_i63.WalletLibWrapper>(() => _i63.WalletLibWrapper());
  gh.factory<_i64.Web3Client>(
      () => networkModule.web3Client(get<_i59.SdkEnv>()));
  gh.factory<_i65.WitnessAuthV2Lib>(() => _i65.WitnessAuthV2Lib());
  gh.factory<_i66.WitnessIsolatesWrapper>(() => _i66.WitnessIsolatesWrapper());
  gh.factory<_i67.WitnessMTPV2Lib>(() => _i67.WitnessMTPV2Lib());
  gh.factory<_i68.WitnessMTPV2OnchainLib>(() => _i68.WitnessMTPV2OnchainLib());
  gh.factory<_i69.WitnessSigV2Lib>(() => _i69.WitnessSigV2Lib());
  gh.factory<_i70.WitnessSigV2OnchainLib>(() => _i70.WitnessSigV2OnchainLib());
  gh.factory<_i71.ZipDecoder>(
    () => zipDecoderModule.zipDecoder(),
    instanceName: 'zipDecoder',
  );
  gh.factory<_i72.AuthProofMapper>(() => _i72.AuthProofMapper(
        get<_i24.HashMapper>(),
        get<_i34.NodeAuxMapper>(),
      ));
  gh.factory<_i73.ClaimMapper>(() => _i73.ClaimMapper(
        get<_i10.ClaimStateMapper>(),
        get<_i9.ClaimInfoMapper>(),
      ));
  gh.factory<_i74.ClaimStoreRefWrapper>(() => _i74.ClaimStoreRefWrapper(
      get<Map<String, _i13.StoreRef<String, Map<String, Object?>>>>(
          instanceName: 'securedStore')));
  gh.factory<_i75.CredentialProofMapper>(
      () => _i75.CredentialProofMapper(get<_i24.HashMapper>()));
  gh.factory<_i76.CredentialProofMapper>(
      () => _i76.CredentialProofMapper(get<_i49.ProofMapper>()));
  gh.factory<_i77.EnvDataSource>(() => _i77.EnvDataSource(get<_i59.SdkEnv>()));
  gh.factory<_i78.GistProofMapper>(
      () => _i78.GistProofMapper(get<_i49.ProofMapper>()));
  gh.factory<_i79.GistProofMapper>(
      () => _i79.GistProofMapper(get<_i24.HashMapper>()));
  gh.factory<_i80.Iden3commCredentialRepositoryImpl>(
      () => _i80.Iden3commCredentialRepositoryImpl(
            get<_i55.RemoteIden3commDataSource>(),
            get<_i50.ProofRequestFiltersMapper>(),
            get<_i73.ClaimMapper>(),
          ));
  gh.factory<_i81.IdentitySMTStoreRefWrapper>(() =>
      _i81.IdentitySMTStoreRefWrapper(
          get<Map<String, _i13.StoreRef<String, Map<String, Object?>>>>(
              instanceName: 'securedStore')));
  gh.factory<_i82.IdentityStoreRefWrapper>(() => _i82.IdentityStoreRefWrapper(
      get<_i13.StoreRef<String, Map<String, Object?>>>(
          instanceName: 'identityStore')));
  gh.factory<_i83.KeyValueStoreRefWrapper>(() => _i83.KeyValueStoreRefWrapper(
      get<_i13.StoreRef<String, dynamic>>(instanceName: 'keyValueStore')));
  gh.factory<_i84.LibPolygonIdCoreCredentialDataSource>(() =>
      _i84.LibPolygonIdCoreCredentialDataSource(
          get<_i42.PolygonIdCoreCredential>()));
  gh.factory<_i85.LibPolygonIdCoreIden3commDataSource>(() =>
      _i85.LibPolygonIdCoreIden3commDataSource(
          get<_i43.PolygonIdCoreIden3comm>()));
  gh.factory<_i86.LibPolygonIdCoreIdentityDataSource>(() =>
      _i86.LibPolygonIdCoreIdentityDataSource(
          get<_i44.PolygonIdCoreIdentity>()));
  gh.factory<_i87.LibPolygonIdCoreWrapper>(
      () => _i87.LibPolygonIdCoreWrapper(get<_i45.PolygonIdCoreProof>()));
  gh.factory<_i88.LocalClaimDataSource>(() => _i88.LocalClaimDataSource(
      get<_i84.LibPolygonIdCoreCredentialDataSource>()));
  gh.factory<_i89.NodeMapper>(() => _i89.NodeMapper(
        get<_i37.NodeTypeMapper>(),
        get<_i36.NodeTypeEntityMapper>(),
        get<_i35.NodeTypeDTOMapper>(),
        get<_i24.HashMapper>(),
      ));
  gh.factoryAsync<_i90.PackageInfoRepository>(() async =>
      repositoriesModule.packageInfoRepository(
          await get.getAsync<_i40.PackageInfoRepositoryImpl>()));
  gh.factory<_i52.ProverLibDataSource>(
      () => _i52.ProverLibDataSource(get<_i52.ProverLibWrapper>()));
  gh.factory<_i91.RPCDataSource>(
      () => _i91.RPCDataSource(get<_i64.Web3Client>()));
  gh.factory<_i92.RhsNodeMapper>(
      () => _i92.RhsNodeMapper(get<_i58.RhsNodeTypeMapper>()));
  gh.factory<_i74.StorageClaimDataSource>(
      () => _i74.StorageClaimDataSource(get<_i74.ClaimStoreRefWrapper>()));
  gh.factoryAsync<_i82.StorageIdentityDataSource>(
      () async => _i82.StorageIdentityDataSource(
            await get.getAsync<_i13.Database>(),
            get<_i82.IdentityStoreRefWrapper>(),
          ));
  gh.factoryAsync<_i83.StorageKeyValueDataSource>(
      () async => _i83.StorageKeyValueDataSource(
            await get.getAsync<_i13.Database>(),
            get<_i83.KeyValueStoreRefWrapper>(),
          ));
  gh.factory<_i81.StorageSMTDataSource>(
      () => _i81.StorageSMTDataSource(get<_i81.IdentitySMTStoreRefWrapper>()));
  gh.factory<_i63.WalletDataSource>(
      () => _i63.WalletDataSource(get<_i63.WalletLibWrapper>()));
  gh.factory<_i66.WitnessDataSource>(
      () => _i66.WitnessDataSource(get<_i66.WitnessIsolatesWrapper>()));
  gh.factory<_i93.ConfigRepositoryImpl>(
      () => _i93.ConfigRepositoryImpl(get<_i77.EnvDataSource>()));
  gh.factory<_i94.CredentialRepositoryImpl>(() => _i94.CredentialRepositoryImpl(
        get<_i54.RemoteClaimDataSource>(),
        get<_i74.StorageClaimDataSource>(),
        get<_i88.LocalClaimDataSource>(),
        get<_i73.ClaimMapper>(),
        get<_i18.FiltersMapper>(),
        get<_i26.IdFilterMapper>(),
      ));
  gh.factoryAsync<_i95.GetPackageNameUseCase>(() async =>
      _i95.GetPackageNameUseCase(
          await get.getAsync<_i90.PackageInfoRepository>()));
  gh.factory<_i96.Iden3commCredentialRepository>(() =>
      repositoriesModule.iden3commCredentialRepository(
          get<_i80.Iden3commCredentialRepositoryImpl>()));
  gh.factory<_i97.Iden3commRepositoryImpl>(() => _i97.Iden3commRepositoryImpl(
        get<_i55.RemoteIden3commDataSource>(),
        get<_i85.LibPolygonIdCoreIden3commDataSource>(),
        get<_i31.LibBabyJubJubDataSource>(),
        get<_i5.AuthResponseMapper>(),
        get<_i4.AuthInputsMapper>(),
        get<_i72.AuthProofMapper>(),
        get<_i79.GistProofMapper>(),
        get<_i53.QMapper>(),
      ));
  gh.factoryAsync<_i98.IdentityRepositoryImpl>(
      () async => _i98.IdentityRepositoryImpl(
            get<_i63.WalletDataSource>(),
            get<_i56.RemoteIdentityDataSource>(),
            await get.getAsync<_i82.StorageIdentityDataSource>(),
            get<_i91.RPCDataSource>(),
            get<_i32.LocalContractFilesDataSource>(),
            get<_i31.LibBabyJubJubDataSource>(),
            get<_i86.LibPolygonIdCoreIdentityDataSource>(),
            get<_i15.EncryptionDbDataSource>(),
            get<_i12.DestinationPathDataSource>(),
            get<_i25.HexMapper>(),
            get<_i47.PrivateKeyMapper>(),
            get<_i28.IdentityDTOMapper>(),
            get<_i92.RhsNodeMapper>(),
            get<_i60.StateIdentifierMapper>(),
            get<_i89.NodeMapper>(),
            get<_i16.EncryptionKeyMapper>(),
          ));
  gh.factory<_i87.LibPolygonIdCoreProofDataSource>(() =>
      _i87.LibPolygonIdCoreProofDataSource(
          get<_i87.LibPolygonIdCoreWrapper>()));
  gh.factory<_i99.ProofRepositoryImpl>(() => _i99.ProofRepositoryImpl(
        get<_i66.WitnessDataSource>(),
        get<_i52.ProverLibDataSource>(),
        get<_i87.LibPolygonIdCoreProofDataSource>(),
        get<_i33.LocalProofFilesDataSource>(),
        get<_i48.ProofCircuitDataSource>(),
        get<_i56.RemoteIdentityDataSource>(),
        get<_i32.LocalContractFilesDataSource>(),
        get<_i8.CircuitsDownloadDataSource>(),
        get<_i91.RPCDataSource>(),
        get<_i7.CircuitTypeMapper>(),
        get<_i30.JWZProofMapper>(),
        get<_i73.ClaimMapper>(),
        get<_i57.RevocationStatusMapper>(),
        get<_i29.JWZMapper>(),
        get<_i72.AuthProofMapper>(),
        get<_i78.GistProofMapper>(),
        get<_i76.CredentialProofMapper>(),
        get<_i79.GistProofMapper>(),
        get<_i75.CredentialProofMapper>(),
      ));
  gh.factory<_i100.SMTDataSource>(() => _i100.SMTDataSource(
        get<_i25.HexMapper>(),
        get<_i31.LibBabyJubJubDataSource>(),
        get<_i81.StorageSMTDataSource>(),
      ));
  gh.factory<_i101.SMTRepositoryImpl>(() => _i101.SMTRepositoryImpl(
        get<_i100.SMTDataSource>(),
        get<_i81.StorageSMTDataSource>(),
        get<_i31.LibBabyJubJubDataSource>(),
        get<_i89.NodeMapper>(),
        get<_i24.HashMapper>(),
        get<_i49.ProofMapper>(),
        get<_i62.TreeTypeMapper>(),
        get<_i61.TreeStateMapper>(),
      ));
  gh.factory<_i102.ConfigRepository>(() =>
      repositoriesModule.configRepository(get<_i93.ConfigRepositoryImpl>()));
  gh.factory<_i103.CredentialRepository>(() => repositoriesModule
      .credentialRepository(get<_i94.CredentialRepositoryImpl>()));
  gh.factory<_i104.GetAuthClaimUseCase>(
      () => _i104.GetAuthClaimUseCase(get<_i103.CredentialRepository>()));
  gh.factory<_i105.GetClaimsUseCase>(
      () => _i105.GetClaimsUseCase(get<_i103.CredentialRepository>()));
  gh.factory<_i106.GetEnvConfigUseCase>(
      () => _i106.GetEnvConfigUseCase(get<_i102.ConfigRepository>()));
  gh.factory<_i107.GetVocabsUseCase>(
      () => _i107.GetVocabsUseCase(get<_i96.Iden3commCredentialRepository>()));
  gh.factory<_i108.Iden3commRepository>(() => repositoriesModule
      .iden3commRepository(get<_i97.Iden3commRepositoryImpl>()));
  gh.factoryAsync<_i109.IdentityRepository>(() async => repositoriesModule
      .identityRepository(await get.getAsync<_i98.IdentityRepositoryImpl>()));
  gh.factoryAsync<_i110.ImportIdentityUseCase>(() async =>
      _i110.ImportIdentityUseCase(
          await get.getAsync<_i109.IdentityRepository>()));
  gh.factory<_i111.ProofRepository>(() =>
      repositoriesModule.proofRepository(get<_i99.ProofRepositoryImpl>()));
  gh.factory<_i112.ProveUseCase>(
      () => _i112.ProveUseCase(get<_i111.ProofRepository>()));
  gh.factory<_i113.RemoveAllClaimsUseCase>(
      () => _i113.RemoveAllClaimsUseCase(get<_i103.CredentialRepository>()));
  gh.factory<_i114.RemoveClaimsUseCase>(
      () => _i114.RemoveClaimsUseCase(get<_i103.CredentialRepository>()));
  gh.factory<_i115.SMTRepository>(
      () => repositoriesModule.smtRepository(get<_i101.SMTRepositoryImpl>()));
  gh.factoryAsync<_i116.SignMessageUseCase>(() async =>
      _i116.SignMessageUseCase(await get.getAsync<_i109.IdentityRepository>()));
  gh.factory<_i117.UpdateClaimUseCase>(
      () => _i117.UpdateClaimUseCase(get<_i103.CredentialRepository>()));
  gh.factory<_i118.CircuitsFilesExistUseCase>(
      () => _i118.CircuitsFilesExistUseCase(get<_i111.ProofRepository>()));
  gh.factory<_i119.DownloadCircuitsUseCase>(() => _i119.DownloadCircuitsUseCase(
        get<_i111.ProofRepository>(),
        get<_i118.CircuitsFilesExistUseCase>(),
      ));
  gh.factoryAsync<_i120.ExportIdentityUseCase>(() async =>
      _i120.ExportIdentityUseCase(
          await get.getAsync<_i109.IdentityRepository>()));
  gh.factoryAsync<_i121.FetchStateRootsUseCase>(() async =>
      _i121.FetchStateRootsUseCase(
          await get.getAsync<_i109.IdentityRepository>()));
  gh.factory<_i122.GetAuthChallengeUseCase>(
      () => _i122.GetAuthChallengeUseCase(get<_i108.Iden3commRepository>()));
  gh.factoryAsync<_i123.GetDidUseCase>(() async =>
      _i123.GetDidUseCase(await get.getAsync<_i109.IdentityRepository>()));
  gh.factoryAsync<_i124.GetGistProofUseCase>(
      () async => _i124.GetGistProofUseCase(
            get<_i111.ProofRepository>(),
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i106.GetEnvConfigUseCase>(),
            await get.getAsync<_i123.GetDidUseCase>(),
          ));
  gh.factoryAsync<_i125.GetIdentitiesUseCase>(() async =>
      _i125.GetIdentitiesUseCase(
          await get.getAsync<_i109.IdentityRepository>()));
  gh.factoryAsync<_i126.GetIdentityAuthClaimUseCase>(
      () async => _i126.GetIdentityAuthClaimUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i104.GetAuthClaimUseCase>(),
          ));
  gh.factory<_i127.GetJWZUseCase>(
      () => _i127.GetJWZUseCase(get<_i111.ProofRepository>()));
  gh.factory<_i128.GetLatestStateUseCase>(
      () => _i128.GetLatestStateUseCase(get<_i115.SMTRepository>()));
  gh.factoryAsync<_i129.GetPublicKeysUseCase>(() async =>
      _i129.GetPublicKeysUseCase(
          await get.getAsync<_i109.IdentityRepository>()));
  gh.factory<_i130.IsProofCircuitSupportedUseCase>(
      () => _i130.IsProofCircuitSupportedUseCase(get<_i111.ProofRepository>()));
  gh.factory<_i131.LoadCircuitUseCase>(
      () => _i131.LoadCircuitUseCase(get<_i111.ProofRepository>()));
  gh.factory<_i132.RemoveIdentityStateUseCase>(
      () => _i132.RemoveIdentityStateUseCase(get<_i115.SMTRepository>()));
  gh.factoryAsync<_i133.CreateIdentityStateUseCase>(
      () async => _i133.CreateIdentityStateUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i115.SMTRepository>(),
            await get.getAsync<_i126.GetIdentityAuthClaimUseCase>(),
          ));
  gh.factoryAsync<_i134.FetchIdentityStateUseCase>(
      () async => _i134.FetchIdentityStateUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i106.GetEnvConfigUseCase>(),
            await get.getAsync<_i123.GetDidUseCase>(),
          ));
  gh.factoryAsync<_i135.GenerateNonRevProofUseCase>(
      () async => _i135.GenerateNonRevProofUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i103.CredentialRepository>(),
            get<_i106.GetEnvConfigUseCase>(),
            await get.getAsync<_i134.FetchIdentityStateUseCase>(),
          ));
  gh.factoryAsync<_i136.GetClaimRevocationStatusUseCase>(
      () async => _i136.GetClaimRevocationStatusUseCase(
            get<_i103.CredentialRepository>(),
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i135.GenerateNonRevProofUseCase>(),
          ));
  gh.factoryAsync<_i137.GetCredentialProofUseCase>(
      () async => _i137.GetCredentialProofUseCase(
            get<_i111.ProofRepository>(),
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i106.GetEnvConfigUseCase>(),
            await get.getAsync<_i123.GetDidUseCase>(),
          ));
  gh.factory<_i138.GetFiltersUseCase>(() => _i138.GetFiltersUseCase(
        get<_i96.Iden3commCredentialRepository>(),
        get<_i130.IsProofCircuitSupportedUseCase>(),
        get<_i23.GetProofRequestsUseCase>(),
      ));
  gh.factoryAsync<_i139.GetGenesisStateUseCase>(
      () async => _i139.GetGenesisStateUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i115.SMTRepository>(),
            await get.getAsync<_i126.GetIdentityAuthClaimUseCase>(),
          ));
  gh.factoryAsync<_i140.GetIden3commClaimsUseCase>(
      () async => _i140.GetIden3commClaimsUseCase(
            get<_i96.Iden3commCredentialRepository>(),
            get<_i105.GetClaimsUseCase>(),
            await get.getAsync<_i136.GetClaimRevocationStatusUseCase>(),
            get<_i117.UpdateClaimUseCase>(),
            get<_i130.IsProofCircuitSupportedUseCase>(),
            get<_i23.GetProofRequestsUseCase>(),
          ));
  gh.factoryAsync<_i141.GetDidIdentifierUseCase>(
      () async => _i141.GetDidIdentifierUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i139.GetGenesisStateUseCase>(),
          ));
  gh.factoryAsync<_i142.GetIdentityUseCase>(
      () async => _i142.GetIdentityUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i123.GetDidUseCase>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i143.GetProfilesUseCase>(
      () async => _i143.GetProfilesUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i142.GetIdentityUseCase>(),
          ));
  gh.factoryAsync<_i144.RemoveIdentityUseCase>(
      () async => _i144.RemoveIdentityUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i143.GetProfilesUseCase>(),
            get<_i132.RemoveIdentityStateUseCase>(),
            get<_i113.RemoveAllClaimsUseCase>(),
          ));
  gh.factoryAsync<_i145.BackupIdentityUseCase>(
      () async => _i145.BackupIdentityUseCase(
            await get.getAsync<_i142.GetIdentityUseCase>(),
            await get.getAsync<_i120.ExportIdentityUseCase>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i146.CheckIdentityValidityUseCase>(
      () async => _i146.CheckIdentityValidityUseCase(
            get<String>(instanceName: 'accessMessage'),
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i147.CreateIdentityUseCase>(
      () async => _i147.CreateIdentityUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i129.GetPublicKeysUseCase>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i148.GenerateProofUseCase>(
      () async => _i148.GenerateProofUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i115.SMTRepository>(),
            get<_i111.ProofRepository>(),
            get<_i112.ProveUseCase>(),
            await get.getAsync<_i142.GetIdentityUseCase>(),
            get<_i104.GetAuthClaimUseCase>(),
            await get.getAsync<_i124.GetGistProofUseCase>(),
            await get.getAsync<_i137.GetCredentialProofUseCase>(),
            await get.getAsync<_i123.GetDidUseCase>(),
            await get.getAsync<_i116.SignMessageUseCase>(),
            get<_i128.GetLatestStateUseCase>(),
          ));
  gh.factoryAsync<_i149.GetAuthInputsUseCase>(
      () async => _i149.GetAuthInputsUseCase(
            await get.getAsync<_i142.GetIdentityUseCase>(),
            get<_i104.GetAuthClaimUseCase>(),
            await get.getAsync<_i116.SignMessageUseCase>(),
            await get.getAsync<_i124.GetGistProofUseCase>(),
            get<_i128.GetLatestStateUseCase>(),
            get<_i108.Iden3commRepository>(),
            await get.getAsync<_i109.IdentityRepository>(),
            get<_i115.SMTRepository>(),
          ));
  gh.factoryAsync<_i150.GetAuthTokenUseCase>(
      () async => _i150.GetAuthTokenUseCase(
            get<_i131.LoadCircuitUseCase>(),
            get<_i127.GetJWZUseCase>(),
            get<_i122.GetAuthChallengeUseCase>(),
            await get.getAsync<_i149.GetAuthInputsUseCase>(),
            get<_i112.ProveUseCase>(),
          ));
  gh.factoryAsync<_i151.GetIden3commProofsUseCase>(
      () async => _i151.GetIden3commProofsUseCase(
            get<_i111.ProofRepository>(),
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i140.GetIden3commClaimsUseCase>(),
            await get.getAsync<_i148.GenerateProofUseCase>(),
            get<_i130.IsProofCircuitSupportedUseCase>(),
            get<_i23.GetProofRequestsUseCase>(),
          ));
  gh.factoryAsync<_i152.Proof>(() async => _i152.Proof(
        await get.getAsync<_i148.GenerateProofUseCase>(),
        get<_i119.DownloadCircuitsUseCase>(),
        get<_i118.CircuitsFilesExistUseCase>(),
      ));
  gh.factoryAsync<_i153.SaveClaimsUseCase>(() async => _i153.SaveClaimsUseCase(
        get<_i19.GetFetchRequestsUseCase>(),
        await get.getAsync<_i150.GetAuthTokenUseCase>(),
        get<_i103.CredentialRepository>(),
      ));
  gh.factoryAsync<_i154.UpdateIdentityUseCase>(
      () async => _i154.UpdateIdentityUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i147.CreateIdentityUseCase>(),
            await get.getAsync<_i133.CreateIdentityStateUseCase>(),
            get<_i132.RemoveIdentityStateUseCase>(),
            get<_i113.RemoveAllClaimsUseCase>(),
          ));
  gh.factoryAsync<_i155.AddIdentityUseCase>(
      () async => _i155.AddIdentityUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i147.CreateIdentityUseCase>(),
            await get.getAsync<_i133.CreateIdentityStateUseCase>(),
          ));
  gh.factoryAsync<_i156.AddProfileUseCase>(() async => _i156.AddProfileUseCase(
        await get.getAsync<_i109.IdentityRepository>(),
        await get.getAsync<_i142.GetIdentityUseCase>(),
        await get.getAsync<_i123.GetDidUseCase>(),
        await get.getAsync<_i154.UpdateIdentityUseCase>(),
      ));
  gh.factoryAsync<_i157.AuthenticateUseCase>(
      () async => _i157.AuthenticateUseCase(
            get<_i108.Iden3commRepository>(),
            await get.getAsync<_i151.GetIden3commProofsUseCase>(),
            await get.getAsync<_i150.GetAuthTokenUseCase>(),
            get<_i106.GetEnvConfigUseCase>(),
            await get.getAsync<_i95.GetPackageNameUseCase>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i158.CreateNewIdentityUseCase>(
      () async => _i158.CreateNewIdentityUseCase(
            get<String>(instanceName: 'accessMessage'),
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i155.AddIdentityUseCase>(),
          ));
  gh.factoryAsync<_i159.Credential>(() async => _i159.Credential(
        await get.getAsync<_i153.SaveClaimsUseCase>(),
        get<_i105.GetClaimsUseCase>(),
        get<_i114.RemoveClaimsUseCase>(),
        get<_i117.UpdateClaimUseCase>(),
      ));
  gh.factoryAsync<_i160.FetchAndSaveClaimsUseCase>(
      () async => _i160.FetchAndSaveClaimsUseCase(
            get<_i96.Iden3commCredentialRepository>(),
            get<_i19.GetFetchRequestsUseCase>(),
            await get.getAsync<_i150.GetAuthTokenUseCase>(),
            await get.getAsync<_i153.SaveClaimsUseCase>(),
          ));
  gh.factoryAsync<_i161.Iden3comm>(() async => _i161.Iden3comm(
        await get.getAsync<_i160.FetchAndSaveClaimsUseCase>(),
        get<_i21.GetIden3MessageUseCase>(),
        await get.getAsync<_i157.AuthenticateUseCase>(),
        get<_i138.GetFiltersUseCase>(),
        await get.getAsync<_i140.GetIden3commClaimsUseCase>(),
        await get.getAsync<_i151.GetIden3commProofsUseCase>(),
      ));
  gh.factoryAsync<_i162.RemoveProfileUseCase>(
      () async => _i162.RemoveProfileUseCase(
            await get.getAsync<_i109.IdentityRepository>(),
            await get.getAsync<_i142.GetIdentityUseCase>(),
            await get.getAsync<_i123.GetDidUseCase>(),
            await get.getAsync<_i154.UpdateIdentityUseCase>(),
          ));
  gh.factoryAsync<_i163.RestoreIdentityUseCase>(
      () async => _i163.RestoreIdentityUseCase(
            await get.getAsync<_i155.AddIdentityUseCase>(),
            await get.getAsync<_i142.GetIdentityUseCase>(),
            await get.getAsync<_i110.ImportIdentityUseCase>(),
            await get.getAsync<_i141.GetDidIdentifierUseCase>(),
          ));
  gh.factoryAsync<_i164.Identity>(() async => _i164.Identity(
        await get.getAsync<_i146.CheckIdentityValidityUseCase>(),
        await get.getAsync<_i158.CreateNewIdentityUseCase>(),
        await get.getAsync<_i163.RestoreIdentityUseCase>(),
        await get.getAsync<_i145.BackupIdentityUseCase>(),
        await get.getAsync<_i142.GetIdentityUseCase>(),
        await get.getAsync<_i125.GetIdentitiesUseCase>(),
        await get.getAsync<_i144.RemoveIdentityUseCase>(),
        await get.getAsync<_i141.GetDidIdentifierUseCase>(),
        await get.getAsync<_i116.SignMessageUseCase>(),
        await get.getAsync<_i134.FetchIdentityStateUseCase>(),
        await get.getAsync<_i156.AddProfileUseCase>(),
        await get.getAsync<_i143.GetProfilesUseCase>(),
        await get.getAsync<_i162.RemoveProfileUseCase>(),
      ));
  return get;
}

class _$PlatformModule extends _i165.PlatformModule {}

class _$NetworkModule extends _i165.NetworkModule {}

class _$DatabaseModule extends _i165.DatabaseModule {}

class _$EncryptionModule extends _i165.EncryptionModule {}

class _$Sdk extends _i165.Sdk {}

class _$ZipDecoderModule extends _i165.ZipDecoderModule {}

class _$RepositoriesModule extends _i165.RepositoriesModule {}
