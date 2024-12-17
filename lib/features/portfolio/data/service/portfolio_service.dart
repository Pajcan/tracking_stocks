import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_stocks/core/constants/app_constants.dart';
import 'package:tracking_stocks/core/networking/dio_service.dart';
import 'package:tracking_stocks/features/portfolio/data/model/portfolio_response.dart';

part 'portfolio_service.g.dart';

@RestApi()
abstract class PortfolioService {
  factory PortfolioService(DioService dioService) {
    final dio = dioService.dio;
    return _PortfolioService(dio);
  }

  @GET(AppConstants.portfolioPath)
  Future<PortfolioResponse> fetchPortfolio();
}