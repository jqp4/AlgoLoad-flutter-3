import 'dart:async';

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:flutter/material.dart';

enum AppBuildType {
  development,
  staging,
  production,
}

Future<void> bootstrap(
  Widget Function() appBuilder,
  AppBuildType appBuildType,
) async {
  final log = MyWebLogger('bootstrap_root')..finest('start');

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      configureDependencies();
      await inject<BootstrapService>().init(appBuildType);

      runApp(appBuilder());
    },
    (error, stackTrace) async {
      log.shout(error.toString(), error, stackTrace);
    },
  );
}
