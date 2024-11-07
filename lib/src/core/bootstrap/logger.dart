import 'package:fancy_logger/fancy_logger.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

const _devLogsRetainSessionCount = 100;
const _prodLogsRetainSessionCount = 50;

Future<void> configureLogger(
  AppBuildType appBuildType,
) async {
  var retainStrategy = {Level.ALL: 100};

  /// Log levels depending on build type
  switch (appBuildType) {
    case AppBuildType.development:
      retainStrategy = {
        Level.ALL: _devLogsRetainSessionCount,
        Level.SEVERE: _devLogsRetainSessionCount,
      };
    case AppBuildType.staging:
      retainStrategy = {
        Level.ALL: _devLogsRetainSessionCount,
        Level.SEVERE: _devLogsRetainSessionCount,
      };
    case AppBuildType.production:
      retainStrategy = {
        Level.ALL: _prodLogsRetainSessionCount,
        Level.SEVERE: _prodLogsRetainSessionCount,
      };
  }

  final version = inject<AppVersionService>();
  final packageInfoString = '[${version.appVersion}:${version.buildNumber}]';

  final fancyLogger = inject<FancyLogger>();
  await fancyLogger.init(retainStrategy, sessionStartExtra: packageInfoString);
}

Future<void> startLogSession() async {
  await inject<FancyLogger>().startSession();
}
