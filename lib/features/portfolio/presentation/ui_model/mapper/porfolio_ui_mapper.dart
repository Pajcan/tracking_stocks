import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/balance.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/instrument.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/position.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/investments_ui_model.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';

@injectable
class PortfolioUiMapper {
  PortfolioUiModel map(Portfolio portfolio) {
    return PortfolioUiModel(
      userBalance: _mapUserBalance(portfolio.balance),
      investments: portfolio.positions.map(_mapInvestments).toList(),
    );
  }

  UserBalanceUiModel _mapUserBalance(Balance balance) {
    return UserBalanceUiModel(
      netValue: balance.netValue.toStringAsFixed(2),
      pnl: balance.pnl.toStringAsFixed(2),
      pnlPercentage: balance.pnlPercentage,
    );
  }

  InvestmentsUiModel _mapInvestments(Position position) {
    return InvestmentsUiModel(
      instrument: _mapInstrument(position.instrument),
      position: _mapPosition(position),
    );
  }

  InstrumentUiModel _mapInstrument(Instrument instrument) {
    return InstrumentUiModel(
      name: instrument.name,
      exchange: instrument.exchange,
      ticker: instrument.ticker,
      currency: instrument.currency,
      lastTradePrice: instrument.lastTradedPrice.toStringAsFixed(2),
    );
  }

  PositionUiModel _mapPosition(Position position) {
    return PositionUiModel(
      pnl: position.pnl.toStringAsFixed(2),
      pnlPercentage: position.pnlPercentage,
      quantity: position.quantity.toStringAsFixed(2),
      averagePrice: position.averagePrice.toStringAsFixed(2),
      costs: position.cost.toStringAsFixed(2),
      marketValue: position.marketValue.toStringAsFixed(2),
    );
  }
}