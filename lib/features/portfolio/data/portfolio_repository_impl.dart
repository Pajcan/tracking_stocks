import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/portfolio_repository.dart';

import 'mappers/portfolio_mapper.dart';
import 'service/portfolio_service.dart';


@LazySingleton(as: PortfolioRepository)
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioService _service;
  final PortfolioMapper _mapper;

  PortfolioRepositoryImpl(this._service, this._mapper);

  @override
  Stream<Portfolio> getPortfolio() async* {
    try {
      final portfolioResponse = await _service.fetchPortfolio();
      final portfolio = _mapper.mapToDomain(portfolioResponse);

      yield portfolio;
    } catch (e) {
      throw NetworkException();
    }
  }
}
