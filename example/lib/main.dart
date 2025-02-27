import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/dependency_injection/dependencies_provider.dart'
    as di;
import 'package:polygonid_flutter_sdk_example/src/presentation/app.dart';

Future<void> main() async {
  //Dependency Injection initialization
  await di.init();

  // App UI locked in portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
