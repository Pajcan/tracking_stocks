// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tracking_stocks/app/di/api_client_module.dart' as _i532;
import 'package:tracking_stocks/core/config/app_config.dart' as _i979;
import 'package:tracking_stocks/core/config/config.dart' as _i301;
import 'package:tracking_stocks/core/di/shared_pref_module.dart' as _i119;
import 'package:tracking_stocks/core/localization/data/locale_data_source.dart'
    as _i505;
import 'package:tracking_stocks/core/localization/data/localization_repository_impl.dart'
    as _i680;
import 'package:tracking_stocks/core/localization/domain/localization_repository.dart'
    as _i166;
import 'package:tracking_stocks/core/localization/domain/use_case/get_locale_use_case.dart'
    as _i198;
import 'package:tracking_stocks/core/localization/domain/use_case/save_locale_use_case.dart'
    as _i363;
import 'package:tracking_stocks/core/localization/presentation/locale_notifier.dart'
    as _i174;
import 'package:tracking_stocks/core/networking/dio_service.dart' as _i724;
import 'package:tracking_stocks/features/portfolio/data/mappers/portfolio_mapper.dart'
    as _i717;
import 'package:tracking_stocks/features/portfolio/data/market_simulator.dart'
    as _i861;
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
import 'package:tracking_stocks/features/portfolio/presentation/user_header/bloc/user_header_cubit.dart'
    as _i483;

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
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final apiClientModule = _$ApiClientModule();
    gh.factory<_i38.PortfolioUiMapper>(() => _i38.PortfolioUiMapper());
    gh.factory<_i861.MarketSimulator>(() => _i861.MarketSimulator());
    gh.singleton<_i460.SharedPreferencesAsync>(
        () => sharedPreferencesModule.sharedPreferences);
    gh.lazySingleton<_i9.PortfolioService>(() => apiClientModule.apiClient);
    gh.lazySingleton<_i717.PortfolioMapper>(() => _i717.PortfolioMapper());
    gh.factory<_i301.IConfig>(() => _i979.AppConfig());
    gh.lazySingleton<_i695.PortfolioRepository>(
        () => _i1011.PortfolioRepositoryImpl(
              gh<_i9.PortfolioService>(),
              gh<_i717.PortfolioMapper>(),
              gh<_i861.MarketSimulator>(),
            ));
    gh.lazySingleton<_i505.LocaleDataSource>(
        () => _i505.LocaleDataSource(gh<_i460.SharedPreferencesAsync>()));
    gh.factory<_i885.GetPortfolioUseCase>(
        () => _i885.GetPortfolioUseCase(gh<_i695.PortfolioRepository>()));
    gh.lazySingleton<_i166.LocalizationRepository>(
        () => _i680.LocalizationRepositoryImpl(gh<_i505.LocaleDataSource>()));
    gh.singleton<_i724.DioService>(() => _i724.DioService(gh<_i301.IConfig>()));
    gh.factory<_i198.GetLocaleUseCase>(
        () => _i198.GetLocaleUseCase(gh<_i166.LocalizationRepository>()));
    gh.factory<_i363.SaveLocaleUseCase>(
        () => _i363.SaveLocaleUseCase(gh<_i166.LocalizationRepository>()));
    gh.factory<_i11.PortfolioBloc>(() => _i11.PortfolioBloc(
          gh<_i885.GetPortfolioUseCase>(),
          gh<_i38.PortfolioUiMapper>(),
        ));
    gh.lazySingleton<_i174.LocaleNotifier>(
        () => _i174.LocaleNotifier(gh<_i198.GetLocaleUseCase>()));
    gh.factory<_i483.UserHeaderCubit>(() => _i483.UserHeaderCubit(
          gh<_i198.GetLocaleUseCase>(),
          gh<_i363.SaveLocaleUseCase>(),
          gh<_i174.LocaleNotifier>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i119.SharedPreferencesModule {}

class _$ApiClientModule extends _i532.ApiClientModule {}
