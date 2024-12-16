import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/data/mappers/portfolio_mapper.dart';
import 'package:tracking_stocks/features/portfolio/data/market_simulator.dart';
import 'package:tracking_stocks/features/portfolio/data/model/balance_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/instrument_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/portfolio_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/position_response.dart';
import 'package:tracking_stocks/features/portfolio/data/portfolio_repository_impl.dart';
import 'package:tracking_stocks/features/portfolio/data/service/portfolio_service.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/balance.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/instrument.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/position.dart';

import 'portfolio_repository_test.mocks.dart';

@GenerateMocks([PortfolioService, MarketSimulator])
void main() {
  late MockPortfolioService mockService;
  late MockMarketSimulator mockMarketSimulator;
  late PortfolioRepositoryImpl repository;
  late PortfolioMapper portfolioMapper;

  // Data:
  final positionResponse = PositionResponse(
    instrument: InstrumentResponse(
      ticker: 'SXR8',
      name: 'iShares Core S&P 500',
      exchange: 'IBIS',
      currency: 'EUR',
      lastTradedPrice: 611.64,
    ),
    quantity: 8.4,
    averagePrice: 393.77,
    cost: 3307.7,
    marketValue: 5134,
    pnl: 1829.24,
    pnlPercentage: 55.2,
  );

  final portfolioResponse = PortfolioResponse(
    portfolio: PortfolioContentResponse(
      balance: BalanceResponse(
          netValue: 32432.54, pnl: 10332.55, pnlPercentage: 31.52),
      positions: [positionResponse, positionResponse],
    ),
  );

  final mappedPosition = Position(
    instrument: Instrument(
      ticker: 'SXR8',
      name: 'iShares Core S&P 500',
      exchange: 'IBIS',
      currency: 'EUR',
      lastTradedPrice: 611.64,
    ),
    quantity: 8.4,
    averagePrice: 393.77,
    cost: 3307.7,
    marketValue: 5134,
    pnl: 1829.24,
    pnlPercentage: 55.2,
  );

  final mappedPortfolio = Portfolio(
    balance: Balance(netValue: 32432.54, pnl: 10332.55, pnlPercentage: 31.52),
    positions: [mappedPosition, mappedPosition],
  );

  setUp(() {
    mockService = MockPortfolioService();
    portfolioMapper = PortfolioMapper();
    mockMarketSimulator = MockMarketSimulator();
    repository =
        PortfolioRepositoryImpl(mockService, portfolioMapper, mockMarketSimulator);
  });

  group('getInitialPortfolio', () {
    test('should return Portfolio when fetch and mapping succeed', () async {
      // Arrange
      when(mockService.fetchPortfolio())
          .thenAnswer((_) async => portfolioResponse);

      // Act
      final result = await repository.getInitialPortfolio();

      // Assert
      expect(result, equals(mappedPortfolio));
      verify(mockService.fetchPortfolio()).called(1);
    });

    test('should throw an exception when fetch fails', () async {
      // Arrange
      when(mockService.fetchPortfolio()).thenThrow(NetworkException());

      // Act
      final call = repository.getInitialPortfolio;

      // Assert
      expect(() => call(), throwsA(isA<NetworkException>()));
      verify(mockService.fetchPortfolio()).called(1);
    });
  });

  group('observePortfolioStream', () {
    test('should emit initial portfolio and simulated portfolio updates',
        () async {
      // Arrange
      final simulatedPortfolio = [
        mappedPortfolio,
        mappedPortfolio.copyWith(
          balance: mappedPortfolio.balance.copyWith(netValue: 40000),
        ),
        mappedPortfolio.copyWith(
          balance: mappedPortfolio.balance.copyWith(netValue: 50000),
        ),
      ];

      when(mockService.fetchPortfolio())
          .thenAnswer((_) async => portfolioResponse);

      when(mockMarketSimulator.simulateMarket(mappedPortfolio))
          .thenAnswer((_) => Stream.fromIterable(simulatedPortfolio));

      // Act
      final stream = repository.observePortfolioStream();
      final results = await stream.toList();

      // Assert
      expect(results, equals(simulatedPortfolio));
      verify(mockMarketSimulator.simulateMarket(mappedPortfolio)).called(1);
    });

    test('should rethrow exceptions from getInitialPortfolio', () async {
      // Arrange
      when(mockService.fetchPortfolio()).thenThrow(NetworkException());

      // Act
      final stream = repository.observePortfolioStream();

      // Assert
      expect(stream.toList(), throwsA(isA<NetworkException>()));
      verifyNever(mockMarketSimulator.simulateMarket(any));
    });
  });
}
