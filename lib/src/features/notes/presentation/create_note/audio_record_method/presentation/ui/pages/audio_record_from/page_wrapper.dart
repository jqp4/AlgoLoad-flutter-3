import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

// import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app_with_ai/src/core/_barrel.dart';
// import 'package:notes_app_with_ai/src/features/notes/presentation/_barrel.dart';
// import 'package:notes_app_with_ai/src/foundation/utils/debug_print.dart';

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

    final log = Logger('algoload_login');
    final client = inject<NetworkDriver>();
    const fineStatusCode = 302;

    final response = await client.post(
      '/login',
      body: {
        'username': username,
        'password': password,
        'submit': submitText,
      },
    );

    final rawData = response.data.toString();
    // final rawHeaders = response.headers;
    // final logData = '(${response.statusCode}):\n'
    //     'rawHeaders: <${rawHeaders.runtimeType}>$rawHeaders'
    //     'rawData: <${rawData.runtimeType}>$rawData';

    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (response.statusCode == fineStatusCode) {
      // final msg = 'Response $logData';
      // log.finest(msg);

      // todo: _safetySerialization()

      final maybeSessionToken = response.headers['set-cookie']?[0].split(';')[0]; // .substring(8);

      if (maybeSessionToken == null) {
        log.severe('SessionToken is null');
        return;
      }

      log.finest('SessionToken: $maybeSessionToken');

      await inject<SecureStorageService>().addValue<String>(
        SecureStorageConstants.accessTokenKey,
        maybeSessionToken,
      );

      log.finest('SessionToken saved');

      // return
    } else {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      // throw ServerException(description: msg);
    }
  }

  Future<void> _receiveTask() async {
    final log = Logger('algoload_receive_task');
    final client = inject<NetworkDriver>();
    const fineStatusCode = 200;

    final response = await client.get(
      '/receive_task',
    );

    final rawData = response.data.toString();
    // final rawHeaders = response.headers;
    // final logData = '(${response.statusCode}):\n'
    //     'rawHeaders: <${rawHeaders.runtimeType}>$rawHeaders'
    //     'rawData: <${rawData.runtimeType}>$rawData';

    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (response.statusCode == fineStatusCode) {
      // final msg = 'Response $logData';
      // log.finest(msg);

      // /static/AlgoViewPage
      final ind0 = rawData.indexOf('/static/AlgoViewPage');
      final ind1 = rawData.indexOf('.json', ind0) + 5;
      final algoviewUrl = rawData.substring(ind0, ind1);

      log.info(algoviewUrl);

      // return
    } else {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      // throw ServerException(description: msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    _auth();
    _receiveTask();

    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('CreateNoteWithAudioRecordPage'),
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
