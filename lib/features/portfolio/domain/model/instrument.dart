import 'package:equatable/equatable.dart';

class Instrument extends Equatable {
  final String ticker;
  final String name;
  final String exchange;
  final String currency;
  final double lastTradedPrice;

  const Instrument({
    required this.ticker,
    required this.name,
    required this.exchange,
    required this.currency,
    required this.lastTradedPrice,
  });

  @override
  List<Object?> get props =>
      [ticker, name, exchange, currency, lastTradedPrice];
}
