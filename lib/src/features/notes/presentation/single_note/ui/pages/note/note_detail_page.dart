import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({
    required this.note,
    super.key,
  });

  final Note note;

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late ThemeData _theme;
  late SingleNoteBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
    _bloc = context.read<SingleNoteBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _theme.colorScheme.surface;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          // AppBar
          SliverAppBar(
            pinned: true,
            backgroundColor: backgroundColor,
            leading: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: const Icon(
                Icons.close_rounded,
                color: Color(0xFFB7B7B7),
              ),
            ),
            actions: [
              // Кнопка more
              IconButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return NoteMoreBottomSheet(
                        bloc: _bloc,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Color(0xFFB7B7B7),
                ),
              ),
            ],
          ),

          // Header
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: make text field
                    Text(
                      widget.note.title,
                      style: _theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap.y(16),
                    Text(
                      DateFormat('dd MMM yyyy').format(widget.note.creationDate),
                      style: _theme.textTheme.bodyLarge?.copyWith(
                        color: _theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap.y(16),
                    NoteTitleContent(
                      noteSource: widget.note.noteSource,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Note text
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList.builder(
              itemCount: widget.note.textBlocks.length,
              itemBuilder: (context, index) {
                final noteTextBlock = widget.note.textBlocks[index];

                return NoteTextBlockWidget(
                  noteTextBlock: noteTextBlock,
                );
              },
            ),
          ),

          const SliverGap.y(50),
        ],
      ),
    );
  }
}

class NoteTextBlockWidget extends StatelessWidget {
  const NoteTextBlockWidget({
    required this.noteTextBlock,
    super.key,
  });

  final NoteTextBlock noteTextBlock;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  noteTextBlock.subtitle,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap.x(12),
              Text(
                noteTextBlock.timing,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: noteTextBlock.texts.length,
          separatorBuilder: (_, __) => const Gap.y(6),
          itemBuilder: (_, index) => Text(
            noteTextBlock.texts[index],
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class NoteTitleContent extends StatelessWidget {
  const NoteTitleContent({
    required this.noteSource,
    this.media,
    this.onPressed,
    super.key,
  });

  // TODO: media
  final dynamic media;
  final VoidCallback? onPressed;
  final NoteSource noteSource;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final backgroundColor = theme.colorScheme.surfaceContainer;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            height: 180.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                noteSource == NoteSource.youtube ? const NoteTitleContentYoutubeVideo() : const NoteTitleContentAudioFile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TODO:
class NoteTitleContentAudioFile extends StatelessWidget {
  const NoteTitleContentAudioFile({
    this.media,
    this.onPressed,
    super.key,
  });

  // TODO: media
  final dynamic media;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Text(
      'Audio file content',
      style: theme.textTheme.headlineLarge?.copyWith(
        color: theme.colorScheme.primary,
      ),
    );
  }
}

// TODO:
class NoteTitleContentYoutubeVideo extends StatelessWidget {
  const NoteTitleContentYoutubeVideo({
    this.media,
    this.onPressed,
    super.key,
  });

  // TODO: media
  final dynamic media;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Text(
      'Youtube video content',
      style: theme.textTheme.headlineLarge?.copyWith(
        color: theme.colorScheme.primary,
      ),
    );
  }
}
