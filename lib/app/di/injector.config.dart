// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tracking_stocks/app/di/api_client_module.dart' as _i532;
import 'package:tracking_stocks/core/config/app_config.dart' as _i979;
import 'package:tracking_stocks/core/config/config.dart' as _i301;
import 'package:tracking_stocks/core/networking/dio_service.dart' as _i724;
import 'package:tracking_stocks/features/portfolio/data/mappers/portfolio_mapper.dart'
    as _i717;
import 'package:tracking_stocks/features/portfolio/data/portfolio_repository_impl.dart'
    as _i1011;
import 'package:tracking_stocks/features/portfolio/data/service/portfolio_service.dart'
    as _i9;
import 'package:tracking_stocks/features/portfolio/domain/portfolio_repository.dart'
    as _i695;
import 'package:tracking_stocks/features/portfolio/domain/use_case/get_porftolio_use_case.dart'
    as _i885;
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart'
    as _i11;
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart'
    as _i38;

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
    final apiClientModule = _$ApiClientModule();
    gh.factory<_i38.PortfolioUiMapper>(() => _i38.PortfolioUiMapper());
    gh.lazySingleton<_i9.PortfolioService>(() => apiClientModule.apiClient);
    gh.lazySingleton<_i717.PortfolioMapper>(() => _i717.PortfolioMapper());
    gh.factory<_i301.IConfig>(() => _i979.AppConfig());
    gh.lazySingleton<_i695.PortfolioRepository>(
        () => _i1011.PortfolioRepositoryImpl(
              gh<_i9.PortfolioService>(),
              gh<_i717.PortfolioMapper>(),
            ));
    gh.factory<_i885.GetPortfolioUseCase>(
        () => _i885.GetPortfolioUseCase(gh<_i695.PortfolioRepository>()));
    gh.singleton<_i724.DioService>(() => _i724.DioService(gh<_i301.IConfig>()));
    gh.factory<_i11.PortfolioBloc>(() => _i11.PortfolioBloc(
          gh<_i885.GetPortfolioUseCase>(),
          gh<_i38.PortfolioUiMapper>(),
        ));
    return this;
  }
}

class _$ApiClientModule extends _i532.ApiClientModule {}
