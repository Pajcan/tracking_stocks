import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';

abstract class PortfolioRepository {
  Stream<Portfolio> observePortfolioStream();

  Future<Portfolio> getInitialPortfolio();
}
