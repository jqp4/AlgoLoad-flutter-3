import 'package:fancy_logger/fancy_logger.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  generateForDir: ['lib'],
  externalPackageModulesBefore: [
    ExternalModule(FancyLoggerPackageModule),
    // ExternalModule(EncryptedStoragePackageModule),
  ],
)
Future<void> configureDependencies() => getIt.init();

T inject<T extends Object>({
  String? instanceName,
}) =>
    getIt.get<T>(
      instanceName: instanceName,
    );
