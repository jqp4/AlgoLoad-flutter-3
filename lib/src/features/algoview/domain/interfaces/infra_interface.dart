import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;

// todo
abstract interface class IAlgoViewRepository {
  Future<Either<Failure, String>> reciveTask(ReciveTaskForm form);
}
