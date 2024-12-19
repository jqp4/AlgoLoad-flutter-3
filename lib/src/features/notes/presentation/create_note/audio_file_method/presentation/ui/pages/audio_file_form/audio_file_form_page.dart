import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class AudioFileFormPage extends StatefulWidget {
  const AudioFileFormPage({
    this.maybeFailureDescription,
    super.key,
  });

  final String? maybeFailureDescription;

  @override
  State<AudioFileFormPage> createState() => _AudioFileFormPageState();
}

class _AudioFileFormPageState extends State<AudioFileFormPage> {
  final TextEditingController _pathFormController = TextEditingController();
  late CreateNoteWithAudioFileBloc _bloc;
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
    _bloc = context.watch<CreateNoteWithAudioFileBloc>();
    _pathFormController.text = _bloc.form.audioFilePath;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _theme.colorScheme.surface;

    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          // Убираем фокус с полей ввода
          context.unfocus();
        },
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Upload audio file',
                    style: _theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SelectAudioFileTileButton(
                  onPressed: (value) {
                    _bloc.add(CreateNoteWithAudioFileEvent.updateFilePathForm(value));
                  },
                ),

                const MyDivider(),

                SelectLanguageTileButton(
                  initialLanguage: _bloc.form.language,
                  onPressed: (value) {
                    _bloc.add(CreateNoteWithAudioFileEvent.updateLanguageForm(value));
                  },
                ),

                // Сообщение об ошибке, если есть
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    widget.maybeFailureDescription ?? '',
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: _theme.colorScheme.error,
                    ),
                  ),
                ),

                const Spacer(),
                MyButton(
                  title: 'Submit',
                  isExpanded: true,
                  onPressed: () {
                    context.read<CreateNoteWithAudioFileBloc>().add(
                          const CreateNoteWithAudioFileEvent.submit(),
                        );
                  },
                ),
                const Gap.y(36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
