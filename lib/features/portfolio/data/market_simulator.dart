import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/balance.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/instrument.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/position.dart';

@injectable
class MarketSimulator {
  final Random _random = Random();

  Stream<Portfolio> simulateMarket(Portfolio portfolio) async* {
    Portfolio currentPortfolio = portfolio;

    while (true) {
      await Future.delayed(Duration(seconds: 1));

      final updatedPositions =
          _calculateUpdatedPositions(currentPortfolio.positions);

      final updatedBalance = _calculateUpdatedBalance(updatedPositions);

      currentPortfolio = currentPortfolio.copyWith(
        balance: updatedBalance,
        positions: updatedPositions,
      );

      yield currentPortfolio;
    }
  }

  List<Position> _calculateUpdatedPositions(List<Position> positions) {
    return positions.map((position) {
      final newPrice =
          _generateRandomPrice(position.instrument.lastTradedPrice);
      final marketValue = position.quantity * newPrice;
      final pnl = marketValue - position.cost;
      final pnlPercentage =
          (pnl * 100) / (position.cost > 0 ? position.cost : 1);

      return position.copyWith(
        instrument: position.instrument.copyWith(lastTradedPrice: newPrice),
        marketValue: marketValue,
        pnl: pnl,
        pnlPercentage: pnlPercentage,
      );
    }).toList();
  }

  Balance _calculateUpdatedBalance(List<Position> positions) {
    final netValue = positions.fold<double>(
        0, (sum, position) => sum + position.marketValue);
    final pnl =
        positions.fold<double>(0, (sum, position) => sum + position.pnl);
    final cost =
        positions.fold<double>(0, (sum, position) => sum + position.cost);
    final pnlPercentage = (pnl * 100) / (cost > 0 ? cost : 1);

    return Balance(
      netValue: netValue,
      pnl: pnl,
      pnlPercentage: pnlPercentage,
    );
  }

  double _generateRandomPrice(double basePrice) {
    final variation = (basePrice * 0.1) * (_random.nextDouble() * 2 - 1);
    return (basePrice + variation).clamp(basePrice * 0.9, basePrice * 1.1);
  }
}
