import 'package:algoload_flutter_web_app/src/core/_barrel.dart';

Future<void> configureAppVersionService() async {
  final log = MyWebLogger('bootstrap')..finest('AppVersionService initializating...');

  final service = inject<AppVersionService>();
  await service.init();

  log.finest('AppVersionService initialized');

  // final version = inject<AppVersionService>();
  // final packageInfoString = '[${version.appVersion}:${version.buildNumber}]';
}
