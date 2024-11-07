import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/api/firebase/_barrel.dart';
import 'package:notes_app_with_ai/src/core/di/di.dart';

@singleton
class FirebaseService {
  const FirebaseService();

  Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await inject<FirebaseApi>().initNotifications();
  }
}
