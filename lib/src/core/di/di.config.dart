// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/notes/_barrel.dart' as _i204;
import '../../features/notes/domain/usecases/usecases.dart' as _i308;
import '../../features/notes/external/remote_data_source.dart' as _i231;
import '../../features/notes/infra/_barrel.dart' as _i470;
import '../../features/notes/infra/repository/repository.dart' as _i197;
import '../bootstrap/bootstrap_service.dart' as _i739;
import '../driver/network_driver.dart' as _i342;
import '../services/app_version_service.dart' as _i212;
import '../storage/secure_storage/secure_storage_service.dart' as _i874;
import '../uikit/loading_overlay/loading_overlay.dart' as _i492;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i739.BootstrapService>(() => _i739.BootstrapService());
    gh.singleton<_i342.NetworkDriver>(() => _i342.NetworkDriver());
    gh.singleton<_i212.AppVersionService>(() => _i212.AppVersionService());
    gh.lazySingleton<_i492.LoadingOverlay>(() => _i492.LoadingOverlay());
    gh.lazySingleton<_i874.SecureStorageService>(
        () => _i874.SecureStorageService());
    gh.singleton<_i470.INoteRemoteDataSource>(
        () => const _i231.NoteRemoteDataSourceImpl());
    gh.singleton<_i204.INoteRepository>(
        () => _i197.NoteRepositoryImpl(gh<_i204.INoteRemoteDataSource>()));
    gh.singleton<_i308.SendAudioFileTask>(
        () => _i308.SendAudioFileTask(gh<_i204.INoteRepository>()));
    gh.singleton<_i308.SendYoutubeTask>(
        () => _i308.SendYoutubeTask(gh<_i204.INoteRepository>()));
    gh.singleton<_i308.FetchExpectedNote>(
        () => _i308.FetchExpectedNote(gh<_i204.INoteRepository>()));
    return this;
  }
}
