import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/api/firebase/firebase_service.dart';
import 'package:notes_app_with_ai/src/core/di/di.dart';

Future<void> configureFirebaseService() async {
  final log = Logger('bootstrap')..finest('FirebaseService initializating...');

  final service = inject<FirebaseService>();

  try {
    await service.init();
  } on Exception catch (e) {
    log.severe('Firebase Exception: $e');
  }

  log.finest('FirebaseService initialized');
}
