import 'package:algoload_flutter_web_app/src/core/_barrel.dart';

Future<void> configureNetworkDriver() async {
  final log = MyWebLogger('bootstrap')..finest('NetworkDriver initializating...');

  inject<NetworkDriver>().init();

  log.finest('NetworkDriver initialized');
}
