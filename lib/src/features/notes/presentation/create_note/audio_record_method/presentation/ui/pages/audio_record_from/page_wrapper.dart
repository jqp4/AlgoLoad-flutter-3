import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

@RoutePage()
class CreateNoteWithAudioRecordPage extends StatelessWidget {
  const CreateNoteWithAudioRecordPage({
    // required this.notesBloc,
    super.key,
  });

  // final NotesBloc notesBloc;

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

  Future<void> _receiveTask() async {
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

      // throw ServerException(description: msg);
      return;
    }

    final msg = 'Response $logData';
    log.finest(msg);

    log.info(rawData['algoview_static_link']);
  }

  @override
  Widget build(BuildContext context) {
    _auth().then((_) => _receiveTask());

    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('AlgoLoad Flutter 3'),
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
