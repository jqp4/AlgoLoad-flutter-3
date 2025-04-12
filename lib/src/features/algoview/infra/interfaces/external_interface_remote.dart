import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';

// todo
abstract interface class IAlgoViewRemoteDataSource {
  Future<String> reciveTask(ReciveTaskForm form);
}
