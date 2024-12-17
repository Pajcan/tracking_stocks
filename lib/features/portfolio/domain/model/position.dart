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

  const Position({
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

extension PositionCopyWith on Position {
  Position copyWith({
    Instrument? instrument,
    double? quantity,
    double? averagePrice,
    double? cost,
    double? marketValue,
    double? pnl,
    double? pnlPercentage,
  }) {
    return Position(
      instrument: instrument ?? this.instrument,
      quantity: quantity ?? this.quantity,
      averagePrice: averagePrice ?? this.averagePrice,
      cost: cost ?? this.cost,
      marketValue: marketValue ?? this.marketValue,
      pnl: pnl ?? this.pnl,
      pnlPercentage: pnlPercentage ?? this.pnlPercentage,
    );
  }
}