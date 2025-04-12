import 'dart:io';

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/menu/presentation/ui/widgets/menu.dart';
import 'package:auto_route/auto_route.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:highlight/languages/cpp.dart' as cpp_lang;
import 'package:highlight/languages/json.dart' as json_lang;
import 'package:highlight/languages/xml.dart' as xml_lang;

@RoutePage()
class AlgoViewMainPage extends StatefulWidget {
  const AlgoViewMainPage({super.key});

  @override
  State<AlgoViewMainPage> createState() => _AlgoViewMainPageState();
}

class _AlgoViewMainPageState extends State<AlgoViewMainPage> {
  final _codeController = CodeController();

  final _tmpRemoteDataSource = inject<IAlgoViewRemoteDataSource>();

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

    await _tmpRemoteDataSource.uploadTask(
      _newTask?.graphSourceConfig ?? 'null',
      'flutter_app_upload.${_newTask?.graphSourceConfigType.name}',
    );
  }

  Future<void> _receiveTask() async {
    final receivedTask = await _tmpRemoteDataSource.receiveTask();

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

  GraphSourceConfigType _stringToGraphSourceConfigType(String? value) {
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

  @override
  Widget build(BuildContext context) {
    return SideMenuScaffold(
      title: 'AlgoLoad',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              // maxWidth: MediaQuery.of(context).size.width * 0.7,
              maxWidth: 1000,
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
                        'Graph source code',
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
                      styles: themeMap[Theme.of(context).brightness == Brightness.dark ? 'monokai' : 'a11y-light']!,
                    ),
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
                                graphSourceConfigType: _stringToGraphSourceConfigType(fileData.fileExtension),
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
