import 'package:logging/logging.dart';

import 'package:notes_app_with_ai/src/core/di/di.dart';
import 'package:notes_app_with_ai/src/core/storage/isar/_barrel.dart';

Future<void> configureLocalStorage() async {
  final log = Logger('bootstrap')..finest('LocalStorage initializating...');

  await inject<LocalNotesStorage>().init();
  await inject<LocalExpectedTasksStorage>().init();

  log.finest('LocalStorage initialized');
}
