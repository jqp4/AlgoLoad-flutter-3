import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class SelectAudioFileTileButton extends StatefulWidget {
  const SelectAudioFileTileButton({
    required this.onPressed,
    super.key,
  });

  final void Function(String) onPressed;

  @override
  State<SelectAudioFileTileButton> createState() => _SelectAudioFileTileButtonState();
}

class _SelectAudioFileTileButtonState extends State<SelectAudioFileTileButton> {
  static const _audioFilePicker = AudioFilePicker();
  bool _isLoading = false;
  late ThemeData _theme;
  PlatformFile? _file;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
  }

  // todo: move to state manager (?)
  Future<void> _pickFile() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _file = null;
    });

    _file = await _audioFilePicker.pickFile();
    final filePath = kIsWeb ? null : _file?.path;

    if (filePath != null) {
      widget.onPressed(filePath);
    } else {
      _file = null;
    }

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileName = _file?.name;
    final content = _file == null ? AudioFilePicker.allowedExtensions.join(', ') : fileName!;

    return StandartTileButton(
      onPressed: _pickFile,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select audio file',
            style: _theme.textTheme.bodyLarge,
          ),
          Builder(
            builder: (context) => _isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      content,
                      style: _theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
