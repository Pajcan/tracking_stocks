import 'package:equatable/equatable.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/investments_ui_model.dart';

class PortfolioUiModel extends Equatable {
  final UserBalanceUiModel userBalance;
  final List<InvestmentsUiModel> investments;

  const PortfolioUiModel({
    required this.userBalance,
    required this.investments,
  });

  @override
  List<Object?> get props => [userBalance, investments];
}

class UserBalanceUiModel extends Equatable {
  final String netValue;
  final String pnl;
  final double pnlPercentage;

  const UserBalanceUiModel({
    required this.netValue,
    required this.pnl,
    required this.pnlPercentage,
  });

  @override
  List<Object?> get props => [netValue, pnl, pnlPercentage];
}
