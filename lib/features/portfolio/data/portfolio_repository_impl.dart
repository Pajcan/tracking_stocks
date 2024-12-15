import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/core/error/exception_handler.dart';
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
  Stream<Portfolio> observePortfolioStream() async* {
    try {
      final initialPortfolio = await getInitialPortfolio();

      yield* _marketSimulator.simulateMarket(initialPortfolio);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Portfolio> getInitialPortfolio() async {
    return await handleExceptions(() async {
      final portfolioResponse = await _service.fetchPortfolio();
      return _mapper.mapToDomain(portfolioResponse);
    });
  }
}
