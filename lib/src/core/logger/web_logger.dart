// ignore_for_file: constant_identifier_names

import 'package:algoload_flutter_web_app/src/foundation/_barrel.dart';
import 'package:flutter/foundation.dart';

enum Level {
  FINEST,
  FINER,
  FINE,
  INFO,
  WARNING,
  SEVERE,
  SHOUT,
}

class MyWebLoggerUtils {
  static int get nowTimestamp => DateTime.now().millisecondsSinceEpoch;
}

class MyWebLoggerConfig {
  factory MyWebLoggerConfig() => _instance;

  MyWebLoggerConfig._internal() : initialTimestamp = MyWebLoggerUtils.nowTimestamp;

  static final MyWebLoggerConfig _instance = MyWebLoggerConfig._internal();

  final int initialTimestamp;
}

class MyWebLogger {
  MyWebLogger(this.name) : config = MyWebLoggerConfig();

  final String name;
  final MyWebLoggerConfig config;

  int get _timestamp => MyWebLoggerUtils.nowTimestamp - config.initialTimestamp;

  void _log(Level level, String message, [Object? error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;

    final timestamp = _timestamp;
    final errorStr = error == null ? '' : '\nError: $error';
    final traceStr = stackTrace == null ? '' : '\nTrace: $stackTrace';

    // 🟥 🟦 🟧 🟨 🟩 🟪 🟫 ⬛
    final colorBlock = switch (level) {
      Level.FINEST => '🟩',
      Level.FINER => '🟩',
      Level.FINE => '🟩',
      Level.INFO => '🟪',
      Level.WARNING => '🟧',
      Level.SEVERE => '🟥',
      Level.SHOUT => '⬛',
    };

    final result = '$colorBlock [$name] ${level.name} T+$timestamp: $message$errorStr$traceStr';

    pprint(result);
  }

  void finest(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.FINEST, message, error, stackTrace);

  void finer(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.FINER, message, error, stackTrace);

  void fine(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.FINE, message, error, stackTrace);

  void info(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.INFO, message, error, stackTrace);

  void warning(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.WARNING, message, error, stackTrace);

  void severe(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.SEVERE, message, error, stackTrace);

  void shout(String message, [Object? error, StackTrace? stackTrace]) => _log(Level.SHOUT, message, error, stackTrace);
}
