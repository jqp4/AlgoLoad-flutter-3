import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/bootstrap/_barrel.dart';
import 'package:rxdart/rxdart.dart';

typedef AsyncFunc = Future<void> Function();

/// Stages that will be handled during bootstrap process.
/// If app fails during some stage, then it will be easy to rerun this process.
/// [core] - failed at core stage initialization (never)
/// [storage] - failed at storage stage initialization
/// [connection] - failed during creating connection
/// [features] - failed during creating features
/// [completed] - everything is ok, app works normally
enum BootstrapStages {
  core,
  storage,
  connection,
  features,
  completed,
}

/// Service that allows initialize app stage by stage and re-run some operations
/// if they failed.
@singleton
class BootstrapService {
  static final _log = Logger('bootstrap');

  final _bootstrapStageSubject = BehaviorSubject<BootstrapStages>();

  Stream<BootstrapStages> get bootstrapStageStream => _bootstrapStageSubject;

  BootstrapStages get bootstrapStage => _bootstrapStageSubject.value;

  Future<void> init(AppBuildType appBuildType) async {
    try {
      _bootstrapStageSubject.add(BootstrapStages.core);
      await _coreStage(appBuildType);

      _bootstrapStageSubject.add(BootstrapStages.storage);
      await _storageStage();

      _bootstrapStageSubject.add(BootstrapStages.connection);
      await _connectionStage();

      _bootstrapStageSubject.add(BootstrapStages.features);
      await _featureStage();

      _bootstrapStageSubject.add(BootstrapStages.completed);
    } on Exception catch (e, t) {
      _log.severe('init', e, t);
    }
  }

  Future<void> rerunFailedStages() async {
    var failedStage = bootstrapStage;
    final failedStageIndex = failedStage.index;

    if (failedStage == BootstrapStages.completed) return;

    final stages = <BootstrapStages, AsyncFunc>{
      BootstrapStages.storage: _storageStage,
      BootstrapStages.connection: _connectionStage,
      BootstrapStages.features: _featureStage,
    };

    try {
      for (var index = failedStageIndex; index < BootstrapStages.completed.index; index++) {
        final currentStage = BootstrapStages.values[index];
        // we do not update stage during initialization to avoid changing page in ui
        failedStage = currentStage;
        await stages[currentStage]!();
      }

      _bootstrapStageSubject.add(BootstrapStages.completed);
    } catch (e, t) {
      _log.severe('rerunFailedStages:${failedStage.name}', e, t);
      // update ui
      _bootstrapStageSubject.add(failedStage);

      // allow cubit catch this error
      rethrow;
    }
  }

  Future<void> _coreStage(AppBuildType appBuildType) async {
    await configureAppVersionService();
    await configureLogger(appBuildType);
  }

  Future<void> _storageStage() async {
    await configureLocalStorage();
  }

  Future<void> _connectionStage() async {
    await configureNetworkDriver();
    await configureFirebaseService();
  }

  // TODO:
  Future<void> _featureStage() async {
    // await configureFeatureServices();
  }
}
