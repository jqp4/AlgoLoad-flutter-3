import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class AudioFilePicker {
  const AudioFilePicker();

  // todo: change to xml
  // todo: add other extensions
  static const _allowedExtensions = ['mp3', 'aac', 'wav', 'mp4', 'm4a'];

  static List<String> get allowedExtensions => _allowedExtensions;

  static final _log = MyWebLogger('AudioFilePicker');

  Future<PlatformFile?> pickFile() async {
    PlatformFile? file;

    try {
      await FilePicker.platform
          .pickFiles(
            type: FileType.custom,
            allowedExtensions: _allowedExtensions,
            onFileLoading: (status) => _log.info('FilePicker onFileLoading status: $status'),
          )
          .then((result) => file = result?.files[0]);
    } on PlatformException catch (e, t) {
      _log.severe('PlatformException (Unsupported operation): $e', t);
      // rethrow;
    } on Exception catch (e, t) {
      _log.severe('Unknown Exception: $e', t);
      // rethrow;
    }

    return file;
  }
}
