import 'package:isar/isar.dart';

part 'expected_task_collection.g.dart';

@collection
class ExpectedTaskCollection {
  Id id = Isar.autoIncrement;

  late final String remoteTaskId;
}
