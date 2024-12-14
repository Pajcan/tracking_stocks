part of 'portfolio_bloc.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

final class PortfolioSubscribe extends PortfolioEvent {
  const PortfolioSubscribe();
}
