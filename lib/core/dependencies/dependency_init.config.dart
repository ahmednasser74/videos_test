// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:an_core_network/an_core_network.dart' as _i947;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/videos/data/datasource/index.dart' as _i1057;
import '../../features/videos/data/datasource/local_data_source.dart' as _i739;
import '../../features/videos/data/datasource/remote_data_source.dart' as _i180;
import '../../features/videos/data/repositories/videos_repository_imp.dart'
    as _i337;
import '../../features/videos/domain/repositories/index.dart' as _i253;
import '../../features/videos/domain/repositories/videos_repository.dart'
    as _i836;
import '../../features/videos/domain/usecase/get_videos_usecase.dart' as _i339;
import '../../features/videos/domain/usecase/index.dart' as _i934;
import '../../features/videos/presentation/cubit/get_videos_cubit.dart'
    as _i384;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => registerModule.navigatorKey);
  gh.factory<_i180.VideosRemoteDataSource>(
      () => _i180.VideosRemoteDataSourceImpl(network: gh<_i947.Network>()));
  gh.lazySingleton<_i739.VideosLocalDataSource>(
      () => _i739.VideosLocalDataSourceImpl(network: gh<_i947.Network>()));
  gh.factory<_i253.VideosRepository>(() => _i337.VideosRepositoryImp(
        gh<_i1057.VideosRemoteDataSource>(),
        gh<_i1057.VideosLocalDataSource>(),
      ));
  gh.factory<_i339.GetVideosUseCase>(
      () => _i339.GetVideosUseCase(gh<_i836.VideosRepository>()));
  gh.factory<_i384.GetVideosCubit>(
      () => _i384.GetVideosCubit(gh<_i934.GetVideosUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
