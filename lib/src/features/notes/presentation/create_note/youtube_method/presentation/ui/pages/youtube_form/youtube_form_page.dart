import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class YoutubeFormPage extends StatefulWidget {
  const YoutubeFormPage({
    this.maybeFailureDescription,
    super.key,
  });

  final String? maybeFailureDescription;

  @override
  State<YoutubeFormPage> createState() => _YoutubeFormPageState();
}

class _YoutubeFormPageState extends State<YoutubeFormPage> {
  final TextEditingController _linkFormController = TextEditingController();
  late CreateNoteWithYoutubeBloc _bloc;
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
    _bloc = context.watch<CreateNoteWithYoutubeBloc>();
    _linkFormController.text = _bloc.form.youtubeUrl;
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
                    'YouTube link',
                    style: _theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: MyTextField(
                    label: 'YouTube link',
                    controller: _linkFormController,
                    onChanged: (value) {
                      _bloc.add(CreateNoteWithYoutubeEvent.updateYoutubeLinkForm(value));
                    },
                  ),
                ),

                SelectLanguageTileButton(
                  initialLanguage: _bloc.form.language,
                  onPressed: (value) {
                    _bloc.add(CreateNoteWithYoutubeEvent.updateLanguageForm(value));
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
                    context.read<CreateNoteWithYoutubeBloc>().add(
                          const CreateNoteWithYoutubeEvent.submit(),
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
