// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/algoview/domain/_barrel.dart' as _i914;
import '../../features/algoview/domain/usecases/usecases.dart' as _i761;
import '../../features/algoview/external/remote_data_source.dart' as _i93;
import '../../features/algoview/infra/_barrel.dart' as _i931;
import '../../features/algoview/infra/repository/repository.dart' as _i319;
import '../../features/auth/domain/_barrel.dart' as _i535;
import '../../features/auth/domain/usecases/usecases.dart' as _i478;
import '../../features/auth/external/remote_data_source.dart' as _i52;
import '../../features/auth/infra/_barrel.dart' as _i264;
import '../../features/auth/infra/repository/repository.dart' as _i383;
import '../../features/notes_deprecated/_barrel.dart' as _i723;
import '../../features/notes_deprecated/domain/usecases/usecases.dart' as _i635;
import '../../features/notes_deprecated/external/remote_data_source.dart'
    as _i618;
import '../../features/notes_deprecated/infra/_barrel.dart' as _i788;
import '../../features/notes_deprecated/infra/repository/repository.dart'
    as _i754;
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
    gh.singleton<_i931.IAlgoViewRemoteDataSource>(
        () => const _i93.AlgoViewRemoteDataSourceImpl());
    gh.singleton<_i788.INoteRemoteDataSource>(
        () => const _i618.NoteRemoteDataSourceImpl());
    gh.singleton<_i914.IAlgoViewRepository>(() =>
        _i319.AlgoViewRepositoryImpl(gh<_i931.IAlgoViewRemoteDataSource>()));
    gh.singleton<_i264.IAuthRemoteDataSource>(
        () => const _i52.AuthRemoteDataSourceImpl());
    gh.singleton<_i761.AlgoViewReciveTask>(
        () => _i761.AlgoViewReciveTask(gh<_i914.IAlgoViewRepository>()));
    gh.singleton<_i723.INoteRepository>(
        () => _i754.NoteRepositoryImpl(gh<_i723.INoteRemoteDataSource>()));
    gh.singleton<_i635.SendAudioFileTask>(
        () => _i635.SendAudioFileTask(gh<_i723.INoteRepository>()));
    gh.singleton<_i635.SendYoutubeTask>(
        () => _i635.SendYoutubeTask(gh<_i723.INoteRepository>()));
    gh.singleton<_i635.FetchExpectedNote>(
        () => _i635.FetchExpectedNote(gh<_i723.INoteRepository>()));
    gh.singleton<_i535.IAuthRepository>(
        () => _i383.AuthRepositoryImpl(gh<_i264.IAuthRemoteDataSource>()));
    gh.singleton<_i478.LoginUser>(
        () => _i478.LoginUser(gh<_i535.IAuthRepository>()));
    gh.singleton<_i478.LogoutUser>(
        () => _i478.LogoutUser(gh<_i535.IAuthRepository>()));
    return this;
  }
}
