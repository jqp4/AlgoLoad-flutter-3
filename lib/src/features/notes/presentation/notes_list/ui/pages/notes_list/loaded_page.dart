import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/presentation/notes_list/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadedNotesListPage extends StatefulWidget {
  const LoadedNotesListPage({
    required this.notesList,
    super.key,
  });

  final List<Note> notesList;

  @override
  State<LoadedNotesListPage> createState() => _LoadedNotesListPageState();
}

class _LoadedNotesListPageState extends State<LoadedNotesListPage> {
  late ThemeData _theme;
  late NotesBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
    _bloc = context.watch<NotesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(const NotesEvent.fetch());

    final backgroundColor = _theme.colorScheme.surfaceContainer;

    return Scaffold(
      body: ColoredBox(
        color: backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: backgroundColor,
              actions: [
                // Кнопка настроек
                IconButton(
                  onPressed: () {
                    // Переход на страницу настроек
                    context.router.push(const SettingsRoute());
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Color(0xFFB7B7B7),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'My notes',
                        style: _theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Gap.y(8),
                  ],
                ),
              ),
            ),
            SliverList.separated(
              itemCount: widget.notesList.length,
              separatorBuilder: (context, index) {
                return const Gap.y(8);
              },
              itemBuilder: (context, index) {
                final note = widget.notesList[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: NoteTile(
                    title: note.title,
                    description: note.description,
                    emojiIcon: note.emojiIcon,
                    onPressed: () {
                      if (note.isPendingProcessing || note.storageId == null) {
                        context.showSnackbar('This note is pending processing.');
                        return;
                      }

                      // Переход на страницу заметки
                      context.router.push(
                        SingleNoteRoute(
                          noteStorageId: note.storageId!,
                          notesBloc: _bloc,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SliverGap.y(140),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyFloatedActionButton(
        title: 'New Note',
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return CreateNoteBottomSheet(notesBloc: _bloc);
            },
          );
        },
      ),
    );
  }
}
