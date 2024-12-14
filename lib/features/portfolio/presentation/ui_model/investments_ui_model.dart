import 'package:equatable/equatable.dart';

class InvestmentsUiModel extends Equatable {
  final InstrumentUiModel instrument;
  final PositionUiModel position;

  const InvestmentsUiModel({
    required this.instrument,
    required this.position,
  });

  @override
  List<Object?> get props => [instrument, position];
}

class InstrumentUiModel extends Equatable {
  final String name;
  final String exchange;
  final String ticker;
  final String currency;
  final String lastTradePrice;

  const InstrumentUiModel({
    required this.name,
    required this.exchange,
    required this.ticker,
    required this.currency,
    required this.lastTradePrice,
  });

  @override
  List<Object?> get props => [name, exchange, ticker, currency, lastTradePrice];
}

class PositionUiModel extends Equatable {
  final String pnl;
  final double pnlPercentage;
  final String quantity;
  final String averagePrice;
  final String costs;
  final String marketValue;

  const PositionUiModel({
    required this.pnl,
    required this.pnlPercentage,
    required this.quantity,
    required this.averagePrice,
    required this.costs,
    required this.marketValue,
  });

  @override
  List<Object?> get props =>
      [pnl, pnlPercentage, quantity, averagePrice, costs, marketValue];
}
