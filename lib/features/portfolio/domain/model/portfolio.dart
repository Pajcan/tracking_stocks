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

extension PortfolioCopyWith on Portfolio {
  Portfolio copyWith({
    Balance? balance,
    List<Position>? positions,
  }) {
    return Portfolio(
      balance: balance ?? this.balance,
      positions: positions ?? this.positions,
    );
  }
}
