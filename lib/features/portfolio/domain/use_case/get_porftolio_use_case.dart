import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/use_case/use_case.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/portfolio_repository.dart';

@injectable
class GetPortfolioUseCase extends UseCaseNoParams<Stream<Portfolio>> {
  final PortfolioRepository _portfolioRepository;

  GetPortfolioUseCase(this._portfolioRepository);

  @override
  Stream<Portfolio> execute() {
    return _portfolioRepository.getPortfolio();
  }
}
