import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/auth/_barrel.dart';

class AlgoViewComplitedTask {
  AlgoViewComplitedTask({
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
}

@RoutePage()
class CreateNoteWithAudioRecordPage extends StatefulWidget {
  const CreateNoteWithAudioRecordPage({
    // required this.notesBloc,
    super.key,
  });

  // final NotesBloc notesBloc;

  @override
  State<CreateNoteWithAudioRecordPage> createState() => _CreateNoteWithAudioRecordPageState();
}

class _CreateNoteWithAudioRecordPageState extends State<CreateNoteWithAudioRecordPage> {
  AlgoViewComplitedTask? _task;
  final _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _receiveTask().then(
      (task) {
        if (!mounted) return;
        setState(() {
          _task = task;
          _codeController.text = _task!.graphSourceConfig;
        });
      },
    );
  }

  Future<AlgoViewComplitedTask> _receiveTask() async {
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

    return AlgoViewComplitedTask(
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
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              children: [
                if (_task != null) ...[
                  AlgoViewWebViewContainer(
                    algoViewFullUrl: _task!.algoviewFullUrl,
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
                  ),
                  const SizedBox(height: 32),
                ],

                UnconstrainedBox(
                  child: MyButton(
                    title: 'Upload',
                    onPressed: () {
                      // ...
                    },
                  ),
                ),
                const Gap.y(32),

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
