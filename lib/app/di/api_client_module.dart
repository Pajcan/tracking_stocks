import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/app/di/injector.dart';
import 'package:tracking_stocks/core/networking/dio_service.dart';
import 'package:tracking_stocks/features/portfolio/data/service/portfolio_service.dart';

@module
abstract class ApiClientModule {
  @lazySingleton
  PortfolioService get apiClient => PortfolioService(getIt<DioService>());
}
