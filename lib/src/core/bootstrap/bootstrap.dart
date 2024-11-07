import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/bootstrap/bootstrap_service.dart';
import 'package:notes_app_with_ai/src/core/di/di.dart';

enum AppBuildType {
  development,
  staging,
  production,
}

Future<void> bootstrap(
  Widget Function() appBuilder,
  AppBuildType appBuildType,
) async {
  final log = Logger('bootstrap_root');

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await configureDependencies();
      await inject<BootstrapService>().init(appBuildType);

      runApp(appBuilder());
    },
    (error, stackTrace) async {
      log.shout(error.toString(), error, stackTrace);
    },
  );
}
