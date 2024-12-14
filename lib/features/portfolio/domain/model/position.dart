import 'package:equatable/equatable.dart';

import 'instrument.dart';

class Position extends Equatable {
  final Instrument instrument;
  final double quantity;
  final double averagePrice;
  final double cost;
  final double marketValue;
  final double pnl;
  final double pnlPercentage;

  Position({
    required this.instrument,
    required this.quantity,
    required this.averagePrice,
    required this.cost,
    required this.marketValue,
    required this.pnl,
    required this.pnlPercentage,
  });

  @override
  List<Object?> get props => [instrument, quantity, averagePrice, cost, marketValue, pnl, pnlPercentage];
}