import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

Future<void> handleFirebaseBackgroundMessage(RemoteMessage message) async {
  // pprint('FirebaseBackgroundMessage:');
  // pprint('\tTitle: ${message.notification?.title}');
  // pprint('\tBody: ${message.notification?.body}');
  // pprint('\tPayload: ${message.data}');

  Logger('FirebaseBackgroundMessage').finest(
    'handle:'
    '\nTitle: ${message.notification?.title}'
    '\nBody: ${message.notification?.body}'
    '\nPayload: ${message.data}',
  );
}

@lazySingleton
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    final log = Logger('FirebaseApi');

    await _firebaseMessaging.requestPermission();
    final firebaseCloudMessagingToken = await _firebaseMessaging.getToken();
    log.finest('FirebaseCloudMessagingToken: $firebaseCloudMessagingToken');

    if (firebaseCloudMessagingToken == null) {
      throw Exception('FirebaseCloudMessagingToken is null');
    }

    FirebaseMessaging.onBackgroundMessage(handleFirebaseBackgroundMessage);

    await inject<SecureStorageService>().addValue<String>(
      SecureStorageConstants.accessTokenKey,
      firebaseCloudMessagingToken,
    );
  }
}
