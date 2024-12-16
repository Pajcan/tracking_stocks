import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/portfolio_repository.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/observe_portfolio_use_case.dart';

import 'observe_portfolio_use_case_test.mocks.dart';

@GenerateMocks([PortfolioRepository, Portfolio])
void main() {
  late MockPortfolioRepository mockPortfolioRepository;
  late ObservePortfolioUseCase observePortfolioUseCase;

  setUp(() {
    mockPortfolioRepository = MockPortfolioRepository();
    observePortfolioUseCase = ObservePortfolioUseCase(mockPortfolioRepository);
  });

  test('should return a stream of Portfolio', () {
    // Arrange
    final mockedPortfolio = MockPortfolio();
    final portfolioStream = Stream.value(mockedPortfolio);
    when(mockPortfolioRepository.observePortfolioStream())
        .thenAnswer((_) => portfolioStream);

    // Act
    final result = observePortfolioUseCase.execute();

    // Assert
    expect(result, portfolioStream);
    verify(mockPortfolioRepository.observePortfolioStream()).called(1);
  });

  test('should throw an exception when repository throws an exception', () {
    // Arrange
    when(mockPortfolioRepository.observePortfolioStream())
        .thenThrow(NetworkException());

    // Act
    final call = observePortfolioUseCase.execute;

    // Assert
    expect(() => call(), throwsA(isA<Exception>()));
    verify(mockPortfolioRepository.observePortfolioStream()).called(1);
  });
}
