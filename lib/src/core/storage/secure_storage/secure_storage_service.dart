import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static final _log = Logger('SecureStorageService');

  Future<void> addValue<T>(String key, T value) async {
    _log.info('Adding value by key $key...');

    await _storage.write(key: key, value: value.toString());
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

  Future<void> cleanStorage(String key) async {
    _log.info('Deleting value by key $key...');

    await _storage.delete(key: key);
  }
}
