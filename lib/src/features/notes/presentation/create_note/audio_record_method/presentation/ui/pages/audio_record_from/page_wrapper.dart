import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

class AlgoViewTask {
  AlgoViewTask({
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
  AlgoViewTask? _task;
  final _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _auth().then((_) => _receiveTask().then((task) {
          if (!mounted) return;
          setState(() {
            _task = task;
            _codeController.text = _task!.graphSourceConfig;
          });
        }));
  }

  Future<void> _auth() async {
    const username = 'kkk000';
    const password = 'zZ05w9IXqGbe';
    const submitText = 'Sign In';

    final log = MyWebLogger('algoload_login');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [302, 200];

    final response = await client.post(
      '/app/login',
      body: {
        'username': username,
        'password': password,
        'submit': submitText,
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      // throw ServerException(description: msg);
      return;
    }

    final msg = 'Response $logData';
    log.finest(msg);

    final responseCookies = response.headers['set-cookie'];
    final maybeSessionToken = responseCookies?[0].split(';')[0];
    if (maybeSessionToken == null) return;

    log.finest('SessionToken: $maybeSessionToken');

    await inject<SecureStorageService>().addValue<String>(
      SecureStorageConstants.accessTokenKey,
      maybeSessionToken,
    );

    log.finest('SessionToken saved');
  }

  Future<AlgoViewTask> _receiveTask() async {
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

    return AlgoViewTask(
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          if (_task != null) ...[
            AlgoViewWebViewContainer(
              algoViewFullUrl: _task!.algoviewFullUrl,
            ),
            const SizedBox(height: 20),
            TextField(
              // obscureText: true,
              controller: _codeController,
              minLines: 20,
              maxLines: 50,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Graph source code',
              ),
            ),
            const SizedBox(height: 32),
          ]
        ],
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
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 0, 0),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.all(3),
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
    );
  }
}
