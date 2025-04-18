import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

@lazySingleton
class SecureStorageService {
  SecureStorageService()
      : _storage = const FlutterSecureStorage(
          webOptions: WebOptions(
            dbName: 'AlgoLoadSecureStorage',
            publicKey: 'AlgoLoadWebKey',
          ),
          aOptions: const AndroidOptions(
            encryptedSharedPreferences: true,
          ),
          iOptions: const IOSOptions(),
        );

  final FlutterSecureStorage _storage;

  static final _log = MyWebLogger('SecureStorageService');

  Future<void> addValue<T>(String key, T value) async {
    _log.info('Adding value by key $key...');

    await _storage.write(key: key, value: value.toString());

    _log.info('Value with key $key successfully added.');
  }

  Future<T?> getValue<T>(String key) async {
    _log.info('Getting value by key $key...');

    final value = await _storage.read(key: key, iOptions: IOSOptions.defaultOptions);
    if (value == null) return null;

    if (T == bool) {
      return (value.toLowerCase() == 'true') as T;
    } else if (T == int) {
      return int.tryParse(value) as T?;
    } else if (T == double) {
      return double.tryParse(value) as T?;
    }

    return value as T;
  }

  Future<void> deleteValue(String key) async {
    _log.info('Deleting value by key $key...');

    await _storage.delete(key: key);
  }
}
