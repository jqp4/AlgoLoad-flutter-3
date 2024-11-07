import 'dart:io' as io;
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:path_provider/path_provider.dart';

class DirectoryInfo {
  static Future<io.Directory> getPlatformStorageDirectory() async {
    late final io.Directory? dir;

    if (io.Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await getExternalStorageDirectory();
    }

    if (dir == null) {
      throw const LocalException(
        description: 'getExternalStorageDirectory() gets null',
      );
    }

    return dir;
  }
}
