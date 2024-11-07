import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

@singleton
class LocalExpectedTasksStorage {
  late final Isar _isar;

  Future<void> init() async {
    _isar = await inject<IsarManager>().openIsar(
      IsarNames.expectedTasks,
      ExpectedTaskCollectionSchema,
    );
  }

  @disposeMethod
  Future<void> dispose() async {
    await inject<IsarManager>().closeIsar(_isar);
  }

  Future<Id> addExpectedTask(String taskId) async {
    final expectedTaskCollection = ExpectedTaskCollection()..remoteTaskId = taskId;
    return _isar.writeTxn(() => _isar.expectedTaskCollections.put(expectedTaskCollection));
  }

  Future<bool> deleteExpectedTask(Id id) async {
    return _isar.writeTxn(() => _isar.expectedTaskCollections.delete(id));
  }

  Future<List<ExpectedTaskCollection>> readAllExpectedTasks() async {
    return _isar.txn(() => _isar.expectedTaskCollections.where().findAll());
  }

  Future<List<ExpectedTaskCollection>> findExpectedTasks(String taskId) async {
    return _isar.txn(() => _isar.expectedTaskCollections.filter().remoteTaskIdEqualTo(taskId).findAll());
  }
}
