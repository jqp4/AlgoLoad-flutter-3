import 'package:flutter/foundation.dart';

void pprint(Object? object) {
  // todo: undo

  // Убираем проверку на kDebugMode, чтобы логи отображались всегда
  // if (!kDebugMode) return;

  // Всегда выводить логи, даже в production-режиме
  // ignore: avoid_print
  print(object);
}
