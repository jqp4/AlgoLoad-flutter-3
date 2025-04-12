import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';

abstract interface class IAlgoViewRemoteDataSource {
  Future<void> uploadTask(String fileData, String fileName);

  Future<ComplitedTask> receiveTask();
}
