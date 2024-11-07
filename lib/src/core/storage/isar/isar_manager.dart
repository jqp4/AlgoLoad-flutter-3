import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class IsarManager {
  final _isarCounter = <String, int>{};

  Future<Isar> openIsar(String name, CollectionSchema schema) async {
    final directory = await getApplicationSupportDirectory();
    final isar = Isar.getInstance(name);

    if (isar != null && isar.isOpen) {
      final count = _isarCounter[name] ?? 1;
      _isarCounter[name] = count + 1;
      return isar;
    }

    _isarCounter[name] = 1;

    return Isar.open(
      [schema],
      name: name,
      directory: directory.path,
      inspector: true,
    );
  }

  Future<void> closeIsar(Isar isar) async {
    if (!isar.isOpen) {
      _isarCounter.remove(isar.name);
      return;
    }

    final count = _isarCounter[isar.name] ?? 1;
    _isarCounter[isar.name] = count - 1;

    if (count > 0) return;
    await isar.close();
  }
}
