import 'package:equatable/equatable.dart';

import 'balance.dart';
import 'position.dart';

class Portfolio extends Equatable {
  final Balance balance;
  final List<Position> positions;

  const Portfolio({required this.balance, required this.positions});

  @override
  List<Object?> get props => [balance, positions];
}
