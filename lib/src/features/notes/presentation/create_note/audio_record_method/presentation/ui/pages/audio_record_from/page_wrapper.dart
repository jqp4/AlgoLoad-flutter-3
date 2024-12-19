import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/auth/_barrel.dart';

enum GraphSourceConfigType { xml, json, cpp }

class ComplitedTask {
  const ComplitedTask({
    required this.userComment,
    required this.graphSourceConfig,
    required this.algoviewStaticLink,
    required this.jsonGraphDataLink,
    required this.algoviewFullUrl,
  });

  final String userComment;
  final String graphSourceConfig;
  final String algoviewStaticLink;
  final String jsonGraphDataLink;
  final String algoviewFullUrl;

  // todo: type
  // final GraphSourceConfigType graphSourceConfigType;

  // todo: copyWith
}

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

@RoutePage()
class CreateNoteWithAudioRecordPage extends StatefulWidget {
  const CreateNoteWithAudioRecordPage({super.key});

  @override
  State<CreateNoteWithAudioRecordPage> createState() => _CreateNoteWithAudioRecordPageState();
}

class _CreateNoteWithAudioRecordPageState extends State<CreateNoteWithAudioRecordPage> {
  final _codeController = TextEditingController();

  ComplitedTask? _complitedTask;
  NewTask? _newTask;

  @override
  void initState() {
    super.initState();
    _receiveTask();
  }

  Future<void> _uploadTask() async {
    if (!mounted) return;
    setState(() {
      _complitedTask = null;
    });

    await _uploadTaskRequest();
  }

  Future<void> _receiveTask() async {
    final receivedTask = await _receiveTaskRequest();

    if (!mounted) return;
    setState(() {
      _complitedTask = receivedTask;

      _newTask = NewTask(
        userComment: _complitedTask!.userComment,
        graphSourceConfig: _complitedTask!.graphSourceConfig,
        // todo:
        graphSourceConfigType: GraphSourceConfigType.xml,
      );

      _codeController.text = _newTask!.graphSourceConfig;
    });
  }

  Future<void> _uploadTaskRequest() async {
    final log = MyWebLogger('algoload_upload_task');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.uploadFileFromString(
      '/app/upload_task',
      fileName: 'flutter_app_upload.xml', // todo
      fileFieldName: 'file_data',
      fileData: _newTask?.graphSourceConfig ?? 'null',
      body: {
        'task_code': 'flutter_app',
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

  Future<ComplitedTask> _receiveTaskRequest() async {
    final log = MyWebLogger('algoload_receive_task');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.get(
      '/app/receive_task',
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

    // http://localhost:3001/static/AlgoViewPage.html?jsonGraphDataUrl=/user/kkk000/Json_models/graphData.json
    final algoviewFullUrl =
        "${NetworkDriver.rootUrl}${rawData['algoview_static_link']}?jsonGraphDataUrl=${rawData['json_graph_data_link']}";

    log.info('algoviewFullUrl: $algoviewFullUrl');

    return ComplitedTask(
      userComment: rawData['user_comment'],
      graphSourceConfig: rawData['graph_source_config'],
      algoviewStaticLink: rawData['algoview_static_link'],
      jsonGraphDataLink: rawData['json_graph_data_link'],
      algoviewFullUrl: algoviewFullUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlgoLoad Flutter 3'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              // maxWidth: MediaQuery.of(context).size.width * 0.7,
              maxWidth: 1200,
            ),
            child: Column(
              children: [
                if (_complitedTask != null) ...[
                  AlgoViewWebViewContainer(
                    algoViewFullUrl: _complitedTask!.algoviewFullUrl,
                  ),
                  const SizedBox(height: 32),
                  const Text('Graph source code'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _codeController,
                    minLines: 20,
                    maxLines: 50,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _newTask = _newTask?.copyWith(graphSourceConfig: value);
                    },
                  ),
                  const Gap.y(32),
                  UnconstrainedBox(
                    child: MyButton(
                      title: 'Upload',
                      onPressed: () async {
                        await _uploadTask();
                        await _receiveTask();
                      },
                    ),
                  ),
                  const Gap.y(32),
                ] else ...[
                  const Padding(
                    padding: EdgeInsets.all(64.0),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Gap.y(24.0),
                        Text('Loading...'),
                      ],
                    ),
                  ),
                ],

                // todo: move to profile
                // Sing out (tmp)
                UnconstrainedBox(
                  child: MyButton(
                    title: 'Sing out',
                    onPressed: () {
                      AuthBloc().add(const AuthEvent.logout());
                      Future.delayed(
                        const Duration(milliseconds: 150),
                        () {
                          context.router
                            ..popUntilRoot()
                            ..replace(const LoginRoute());
                        },
                      );
                    },
                  ),
                ),
                const Gap.y(32),
              ],
            ),
          ),
        ),
      ),
    );

    // final loadingOverlay = inject<LoadingOverlay>();

    // return BlocProvider<CreateNoteWithYoutubeBloc>(
    //   create: (_) => CreateNoteWithYoutubeBloc(repository: inject()),
    //   child: BlocConsumer<CreateNoteWithYoutubeBloc, CreateNoteWithYoutubeState>(
    //     listener: (context, state) {
    //       loadingOverlay.hide();

    //       state.whenOrNull(
    //         pending: () {
    //           // show loading indicator
    //           loadingOverlay.show(context);
    //         },
    //         completed: () {
    //           context.router.popUntilRoot();
    //         },
    //       );
    //     },
    //     builder: (context, state) {
    //       String? maybeFailureDescription;

    //       state.whenOrNull(
    //         failure: (failureDescription) {
    //           maybeFailureDescription = failureDescription;
    //         },
    //       );

    //       return YoutubeFormPage(
    //         maybeFailureDescription: maybeFailureDescription,
    //       );
    //     },
    //   ),
    // );
  }
}

class AlgoViewWebViewContainer extends StatelessWidget {
  const AlgoViewWebViewContainer({
    required this.algoViewFullUrl,
    super.key,
  });

  final String algoViewFullUrl;

  static final _log = MyWebLogger('algoview_webview_container');

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(algoViewFullUrl),
            // todo: auth???
            // headers:
          ),
          onWebViewCreated: (controller) async {
            _log.fine('onWebViewCreated');
          },
          onLoadStart: (controller, url) {
            _log.fine('onLoadStart: $url');
          },
          onLoadStop: (controller, url) async {
            _log.fine('onLoadStop: $url');
          },
          onProgressChanged: (controller, progress) {
            _log.fine('onProgressChanged: $progress');
          },
        ),
      ),
    );
  }
}
