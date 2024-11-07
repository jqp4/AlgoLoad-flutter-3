import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/di/di.dart';
import 'package:notes_app_with_ai/src/core/services/app_version_service.dart';

Future<void> configureAppVersionService() async {
  final log = Logger('bootstrap')..finest('AppVersionService initializating...');

  final service = inject<AppVersionService>();
  await service.init();

  log.finest('AppVersionService initialized');
}
