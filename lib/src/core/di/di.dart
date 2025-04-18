import 'package:algoload_flutter_web_app/src/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  generateForDir: ['lib'],
  externalPackageModulesBefore: [
    // ExternalModule(FancyLoggerPackageModule),
    // ExternalModule(EncryptedStoragePackageModule),
  ],
)
void configureDependencies() => getIt.init();

T inject<T extends Object>({
  String? instanceName,
}) =>
    getIt.get<T>(
      instanceName: instanceName,
    );
