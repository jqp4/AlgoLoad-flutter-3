import 'package:logging/logging.dart';

import 'package:notes_app_with_ai/src/core/di/di.dart';
import 'package:notes_app_with_ai/src/core/driver/network_driver.dart';

Future<void> configureNetworkDriver() async {
  final log = Logger('bootstrap')..finest('NetworkDriver initializating...');

  inject<NetworkDriver>().init();

  log.finest('NetworkDriver initialized');
}
