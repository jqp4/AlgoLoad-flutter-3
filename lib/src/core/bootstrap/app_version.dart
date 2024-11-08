import 'package:notes_app_with_ai/src/core/_barrel.dart';

Future<void> configureAppVersionService() async {
  final log = MyWebLogger('bootstrap')..finest('AppVersionService initializating...');

  final service = inject<AppVersionService>();
  await service.init();

  log.finest('AppVersionService initialized');

  // final version = inject<AppVersionService>();
  // final packageInfoString = '[${version.appVersion}:${version.buildNumber}]';
}
