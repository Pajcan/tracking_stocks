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
      final updatedPositions = currentPortfolio.positions.map((position) {
        final newPrice = _generateRandomPrice(position.instrument.lastTradedPrice);
        final marketValue = position.quantity * newPrice;
        final pnl = marketValue - position.cost;
        final pnlPercentage = (pnl * 100) / (position.cost > 0 ? position.cost : 1);

        return position.copyWith(
          instrument: position.instrument.copyWith(lastTradedPrice: newPrice),
          marketValue: marketValue,
          pnl: pnl,
          pnlPercentage: pnlPercentage,
        );
      }).toList();

      // Update balance
      final netValue = updatedPositions.fold<double>(0, (sum, position) => sum + position.marketValue);
      final pnl = updatedPositions.fold<double>(0, (sum, position) => sum + position.pnl);
      final cost = updatedPositions.fold<double>(0, (sum, position) => sum + position.cost);
      final pnlPercentage = (pnl * 100) / (cost > 0 ? cost : 1);

      currentPortfolio = portfolio.copyWith(
        balance: portfolio.balance.copyWith(
          netValue: netValue,
          pnl: pnl,
          pnlPercentage: pnlPercentage,
        ),
        positions: updatedPositions,
      );

      yield currentPortfolio;
    }
  }

  double _generateRandomPrice(double basePrice) {
    final variation = (basePrice * 0.1) * (_random.nextDouble() * 2 - 1);
    return (basePrice + variation).clamp(basePrice * 0.9, basePrice * 1.1);
  }
}