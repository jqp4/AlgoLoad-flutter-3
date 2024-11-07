import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app_with_ai/src/core/_barrel.dart';
// import 'package:notes_app_with_ai/src/features/notes/presentation/_barrel.dart';
// import 'package:notes_app_with_ai/src/foundation/utils/debug_print.dart';

@RoutePage()
class CreateNoteWithAudioRecordPage extends StatelessWidget {
  const CreateNoteWithAudioRecordPage({
    required this.notesBloc,
    super.key,
  });

  final NotesBloc notesBloc;

  @override
  Widget build(BuildContext context) {
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
