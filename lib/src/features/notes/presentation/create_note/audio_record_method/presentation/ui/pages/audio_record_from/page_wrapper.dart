import 'dart:io';

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:highlight/languages/cpp.dart' as cpp_lang;
import 'package:highlight/languages/json.dart' as json_lang;
import 'package:highlight/languages/xml.dart' as xml_lang;

enum GraphSourceConfigType { xml, json, cpp, unknown }

GraphSourceConfigType stringToGraphSourceConfigType(String? value) {
  switch (value) {
    case 'xml':
      return GraphSourceConfigType.xml;
    case 'json':
      return GraphSourceConfigType.json;
    case 'cpp':
      return GraphSourceConfigType.cpp;
    default:
      // throw Exception('Unknown GraphSourceConfigType: $value');
      return GraphSourceConfigType.unknown;
  }
}

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

  // todo: type
  final GraphSourceConfigType graphSourceConfigType;

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

class UploadedConfigFileData {
  const UploadedConfigFileData({
    required this.fileContents,
    required this.fileExtension,
  });

  final String fileContents;
  final String fileExtension;
}

@RoutePage()
class CreateNoteWithAudioRecordPage extends StatefulWidget {
  const CreateNoteWithAudioRecordPage({super.key});

  @override
  State<CreateNoteWithAudioRecordPage> createState() => _CreateNoteWithAudioRecordPageState();
}

class _CreateNoteWithAudioRecordPageState extends State<CreateNoteWithAudioRecordPage> {
  final _codeController = CodeController();

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
        graphSourceConfigType: _complitedTask!.graphSourceConfigType,
      );

      _updateCodeControllerLanguage();

      _codeController.text = _newTask!.graphSourceConfig;
    });
  }

  Future<void> _uploadTaskRequest() async {
    final log = MyWebLogger('algoload_upload_task');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.uploadFileFromString(
      '/app/upload_task',
      // fileName: 'flutter_app_upload.xml', // todo
      fileName: 'flutter_app_upload.${_newTask?.graphSourceConfigType.name}',
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
      graphSourceConfigType: stringToGraphSourceConfigType(rawData['graph_source_type']),
      algoviewStaticLink: rawData['algoview_static_link'],
      jsonGraphDataLink: rawData['json_graph_data_link'],
      algoviewFullUrl: algoviewFullUrl,
    );
  }

  Future<UploadedConfigFileData> _uploadConfigFileFromComputer() async {
    try {
      // Open file picker dialog
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xml', 'json', 'cpp'],
      );

      if (result != null) {
        final file = result.files.first;

        // Validate file extension
        final extension = file.extension?.toLowerCase();
        if (extension != 'xml' && extension != 'json' && extension != 'cpp') {
          throw Exception('Invalid file type. Only XML, JSON, and CPP files are allowed.');
        }

        String contents;
        // Read file contents
        if (file.bytes != null) {
          // For web platform
          contents = String.fromCharCodes(file.bytes!);
        } else if (file.path != null) {
          // For desktop/mobile platforms
          contents = await File(file.path!).readAsString();
        } else {
          contents = 'null';
          // return null;
        }

        return UploadedConfigFileData(
          fileContents: contents,
          fileExtension: extension!,
        );
      }
      // todo: remove
      return const UploadedConfigFileData(
        fileContents: 'null',
        fileExtension: 'xml',
      );
    } catch (e) {
      debugPrint('Error uploading file: $e');
      rethrow;
    }
  }

  void _updateCodeControllerLanguage() {
    _codeController.language = _newTask!.graphSourceConfigType == GraphSourceConfigType.xml
        ? xml_lang.xml
        : _newTask!.graphSourceConfigType == GraphSourceConfigType.json
            ? json_lang.json
            : cpp_lang.cpp;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_complitedTask != null) ...[
                  Text(
                    'User comment: ${_complitedTask!.userComment}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Gap.y(16),
                  AlgoViewWebViewContainer(
                    algoViewFullUrl: _complitedTask!.algoviewFullUrl,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Graph source code (editable)',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      SegmentedButton<GraphSourceConfigType>(
                        showSelectedIcon: false,
                        segments: const [
                          ButtonSegment<GraphSourceConfigType>(
                            value: GraphSourceConfigType.xml,
                            label: Text('XML'),
                          ),
                          ButtonSegment<GraphSourceConfigType>(
                            value: GraphSourceConfigType.json,
                            label: Text('JSON'),
                          ),
                          ButtonSegment<GraphSourceConfigType>(
                            value: GraphSourceConfigType.cpp,
                            label: Text('CPP'),
                          ),
                        ],
                        selected: {_newTask?.graphSourceConfigType ?? GraphSourceConfigType.xml},
                        onSelectionChanged: (selection) {
                          setState(() {
                            _newTask = _newTask?.copyWith(
                              graphSourceConfigType: selection.first,
                            );

                            _updateCodeControllerLanguage();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                            (states) {
                              if (states.contains(WidgetState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              }
                              return Colors.transparent;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap.y(16),
                  CodeTheme(
                    data: CodeThemeData(
                        styles: themeMap[Theme.of(context).brightness == Brightness.dark ? 'monokai' : 'a11y-light']!),
                    child: CodeField(
                      controller: _codeController,
                      minLines: 20,
                      maxLines: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      expands: false,
                      textStyle: const TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 16,
                      ),
                      lineNumberStyle: LineNumberStyle(
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 16,
                        ),
                        width: 50,
                        margin: 15,
                      ),
                      onChanged: (value) {
                        _newTask = _newTask?.copyWith(graphSourceConfig: value);
                      },
                    ),
                  ),

                  // Submition
                  const Gap.y(32),
                  Text(
                    'Submit this ${_newTask?.graphSourceConfigType.name} code or upload the file from your computer:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Gap.y(16),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UnconstrainedBox(
                        child: MyButton(
                          title: 'Submit',
                          onPressed: () async {
                            await _uploadTask();
                            await _receiveTask();
                          },
                        ),
                      ),
                      const Gap.x(48),
                      UnconstrainedBox(
                        child: MyButton(
                          title: 'Upload file',
                          onPressed: () async {
                            final fileData = await _uploadConfigFileFromComputer();
                            setState(() {
                              _codeController.text = fileData.fileContents;
                              _newTask = _newTask?.copyWith(
                                graphSourceConfig: fileData.fileContents,
                                graphSourceConfigType: stringToGraphSourceConfigType(fileData.fileExtension),
                              );
                            });

                            await _uploadTask();
                            await _receiveTask();
                          },
                        ),
                      ),
                    ],
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

                Text(
                  'tmp:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap.y(16),

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
