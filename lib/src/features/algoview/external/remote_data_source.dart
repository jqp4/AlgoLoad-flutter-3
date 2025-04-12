import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/infra/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

// todo
@Singleton(as: IAlgoViewRemoteDataSource)
final class AlgoViewRemoteDataSourceImpl implements IAlgoViewRemoteDataSource {
  const AlgoViewRemoteDataSourceImpl();

  // example:

  // Future<void> logoutUser() async {
  //   final log = MyWebLogger('AlgoViewRemoteDataSourceImpl.logoutUser');
  //   final client = inject<NetworkDriver>();
  //   const fineStatusCodes = [200];

  //   final response = await client.get('/api/logout');

  //   final rawData = response.data;
  //   final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

  //   if (!fineStatusCodes.contains(response.statusCode)) {
  //     final errMsg = 'ServerException: $logData';
  //     log.severe(errMsg);

  //     throw ServerException(description: errMsg);
  //   }

  //   final msg = 'Response: $logData';
  //   log.finest(msg);
  // }

  @override
  Future<String> reciveTask(ReciveTaskForm form) {
    // TODO: implement reciveTask
    throw UnimplementedError();
  }
}
