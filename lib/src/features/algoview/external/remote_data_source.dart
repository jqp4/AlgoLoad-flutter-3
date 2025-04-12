import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/infra/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

// todo
@Singleton(as: IAlgoViewRemoteDataSource)
final class AlgoViewRemoteDataSourceImpl implements IAlgoViewRemoteDataSource {
  const AlgoViewRemoteDataSourceImpl();

  @override
  Future<void> uploadTask(String fileData, String fileName) async {
    final log = MyWebLogger('algoload_upload_task');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.uploadFileFromString(
      '/api/upload_task',
      fileName: fileName,
      fileFieldName: 'file_data',
      fileData: fileData,
      body: {
        'task_code': 'flutter_app_submition', // todo: add userComment to args
        'submit': 'Сгенерировать',
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      throw ServerException(description: msg);
    }

    final msg = 'Response $logData';
    log.finest(msg);
  }

  @override
  Future<ComplitedTask> receiveTask() async {
    final log = MyWebLogger('algoload_receive_task');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.get(
      '/api/receive_task',
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      throw ServerException(description: msg);
    }

    final msg = 'Response $logData';
    log.finest(msg);

    final algoviewFullUrl =
        "${NetworkDriver.rootUrl}${rawData['algoview_static_link']}?jsonGraphDataUrl=${rawData['json_graph_data_link']}";

    log.info('algoviewFullUrl: $algoviewFullUrl');

    return ComplitedTask(
      userComment: rawData['user_comment'],
      graphSourceConfig: rawData['graph_source_config'],
      graphSourceConfigType: _stringToGraphSourceConfigType(rawData['graph_source_type']),
      algoviewStaticLink: rawData['algoview_static_link'],
      jsonGraphDataLink: rawData['json_graph_data_link'],
      algoviewFullUrl: algoviewFullUrl,
    );
  }

  // todo: move to dto folder
  GraphSourceConfigType _stringToGraphSourceConfigType(String? value) {
    switch (value) {
      case 'xml':
        return GraphSourceConfigType.xml;
      case 'json':
        return GraphSourceConfigType.json;
      case 'cpp':
        return GraphSourceConfigType.cpp;
      default:
        return GraphSourceConfigType.unknown;
    }
  }
}
