part of 'portfolio_bloc.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

final class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

final class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

final class PortfolioLoaded extends PortfolioState {
  final PortfolioUiModel portfolioUiModel;

  const PortfolioLoaded({
    required this.portfolioUiModel,
  });

  @override
  List<Object> get props => [portfolioUiModel];

  PortfolioLoaded copyWith({
    PortfolioUiModel? portfolioUiModel,
  }) {
    return PortfolioLoaded(
      portfolioUiModel: portfolioUiModel ?? this.portfolioUiModel,
    );
  }
}

final class PortfolioError extends PortfolioState {
  const PortfolioError();
}
