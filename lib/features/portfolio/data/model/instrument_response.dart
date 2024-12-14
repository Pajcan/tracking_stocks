import 'package:json_annotation/json_annotation.dart';

part 'instrument_response.g.dart';

@JsonSerializable()
class InstrumentResponse {
  final String? ticker;
  final String? name;
  final String? exchange;
  final String? currency;
  final double? lastTradedPrice;

  InstrumentResponse({
    this.ticker,
    this.name,
    this.exchange,
    this.currency,
    this.lastTradedPrice,
  });

  factory InstrumentResponse.fromJson(Map<String, dynamic> json) =>
      _$InstrumentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InstrumentResponseToJson(this);
}

extension InstrumentResponseCopyWith on InstrumentResponse {
  InstrumentResponse copyWith({
    String? ticker,
    String? name,
    String? exchange,
    String? currency,
    double? lastTradedPrice,
  }) {
    return InstrumentResponse(
      ticker: ticker ?? this.ticker,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      currency: currency ?? this.currency,
      lastTradedPrice: lastTradedPrice ?? this.lastTradedPrice,
    );
  }
}
