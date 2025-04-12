import 'package:algoload_flutter_web_app/src/features/algoview/domain/entities/graph_source_config_type.dart';

class NewTask {
  const NewTask({
    required this.userComment,
    required this.graphSourceConfig,
    required this.graphSourceConfigType,
  });

  final String userComment;
  final String graphSourceConfig;
  final GraphSourceConfigType graphSourceConfigType;

  NewTask copyWith({
    String? userComment,
    String? graphSourceConfig,
    GraphSourceConfigType? graphSourceConfigType,
  }) {
    return NewTask(
      userComment: userComment ?? this.userComment,
      graphSourceConfig: graphSourceConfig ?? this.graphSourceConfig,
      graphSourceConfigType: graphSourceConfigType ?? this.graphSourceConfigType,
    );
  }
}
