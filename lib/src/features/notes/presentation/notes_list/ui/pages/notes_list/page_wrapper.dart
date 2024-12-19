import 'package:algoload_flutter_web_app/src/features/notes/presentation/notes_list/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (_) => NotesBloc()
        ..add(const NotesEvent.read())
        ..add(const NotesEvent.fetch()),
      child: BlocConsumer<NotesBloc, NotesState>(
        listener: (context, state) {
          /** */
        },
        builder: (context, state) {
          return state.when(
            initial: () => const InitialNotesListPage(),
            pending: () => const PendingNotesListPage(),
            loaded: (userProfile) => LoadedNotesListPage(
              notesList: userProfile,
            ),
            failure: (failureDescription) => FailureNotesListPage(
              failureDescription: failureDescription,
            ),
          );
        },
      ),
    );
  }
}
