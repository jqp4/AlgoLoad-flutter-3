import 'package:algoload_flutter_web_app/src/features/algoview/domain/entities/graph_source_config_type.dart';

class ComplitedTask {
  const ComplitedTask({
    required this.userComment,
    required this.graphSourceConfig,
    required this.algoviewStaticLink,
    required this.jsonGraphDataLink,
    required this.algoviewFullUrl,
    required this.graphSourceConfigType,
  });

  final String userComment;
  final String graphSourceConfig;
  final String algoviewStaticLink;
  final String jsonGraphDataLink;
  final String algoviewFullUrl;
  final GraphSourceConfigType graphSourceConfigType;

  @Deprecated('const entity')
  ComplitedTask copyWith({
    String? userComment,
    String? graphSourceConfig,
    String? algoviewStaticLink,
    String? jsonGraphDataLink,
    String? algoviewFullUrl,
    GraphSourceConfigType? graphSourceConfigType,
  }) {
    return ComplitedTask(
      userComment: userComment ?? this.userComment,
      graphSourceConfig: graphSourceConfig ?? this.graphSourceConfig,
      algoviewStaticLink: algoviewStaticLink ?? this.algoviewStaticLink,
      jsonGraphDataLink: jsonGraphDataLink ?? this.jsonGraphDataLink,
      algoviewFullUrl: algoviewFullUrl ?? this.algoviewFullUrl,
      graphSourceConfigType: graphSourceConfigType ?? this.graphSourceConfigType,
    );
  }
}
