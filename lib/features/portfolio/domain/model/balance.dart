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
