import 'package:polygonid_flutter_sdk/common/domain/use_cases/get_config_use_case.dart';
import 'package:polygonid_flutter_sdk/env/sdk_env.dart';

class EnvDataSource {
  final SdkEnv _sdkEnv;

  EnvDataSource(this._sdkEnv);

  String getConfig({required PolygonIdConfig config}) {
    switch (config) {
      case PolygonIdConfig.networkName:
        return _sdkEnv.networkName;
      case PolygonIdConfig.networkEnv:
        return _sdkEnv.networkEnv;
      case PolygonIdConfig.infuraUrl:
        return _sdkEnv.infuraUrl;
      case PolygonIdConfig.infuraRdpUrl:
        return _sdkEnv.infuraRdpUrl;
      case PolygonIdConfig.infuraApiKey:
        return _sdkEnv.infuraApiKey;
      case PolygonIdConfig.idStateContractAddress:
        return _sdkEnv.idStateContractAddress;
      case PolygonIdConfig.credentialsKey:
        return _sdkEnv.credentialsKey;

      // case PolygonIdConfig.pushUrl:
      //   return _sdkEnv.pushUrl;
    }
  }
}
