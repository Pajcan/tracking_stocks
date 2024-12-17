import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  final double netValue;
  final double pnl;
  final double pnlPercentage;

  const Balance({
    required this.netValue,
    required this.pnl,
    required this.pnlPercentage,
  });

  @override
  List<Object?> get props => [netValue, pnl, pnlPercentage];
}

extension BalanceCopyWith on Balance {
  Balance copyWith({
    double? netValue,
    double? pnl,
    double? pnlPercentage,
  }) {
    return Balance(
      netValue: netValue ?? this.netValue,
      pnl: pnl ?? this.pnl,
      pnlPercentage: pnlPercentage ?? this.pnlPercentage,
    );
  }
}
