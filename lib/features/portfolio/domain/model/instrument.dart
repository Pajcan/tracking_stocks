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

extension InstrumentCopyWith on Instrument {
  Instrument copyWith({
    String? ticker,
    String? name,
    String? exchange,
    String? currency,
    double? lastTradedPrice,
  }) {
    return Instrument(
      ticker: ticker ?? this.ticker,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      currency: currency ?? this.currency,
      lastTradedPrice: lastTradedPrice ?? this.lastTradedPrice,
    );
  }
}
