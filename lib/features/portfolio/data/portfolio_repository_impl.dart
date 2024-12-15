import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/portfolio_repository.dart';

import 'mappers/portfolio_mapper.dart';
import 'market_simulator.dart';
import 'service/portfolio_service.dart';


@LazySingleton(as: PortfolioRepository)
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioService _service;
  final PortfolioMapper _mapper;
  final MarketSimulator _marketSimulator;

  PortfolioRepositoryImpl(this._service, this._mapper, this._marketSimulator);

  @override
  Stream<Portfolio> getPortfolio() async* {
    try {
      final portfolioResponse = await _service.fetchPortfolio();
      final portfolio = _mapper.mapToDomain(portfolioResponse);

      yield* _marketSimulator.simulateMarket(portfolio);
    } catch (e) {
      throw NetworkException();
    }
  }
}
