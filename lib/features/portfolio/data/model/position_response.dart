import 'package:json_annotation/json_annotation.dart';

import 'instrument_response.dart';

part 'position_response.g.dart';

@JsonSerializable()
class PositionResponse {
  final InstrumentResponse? instrument;
  final double? quantity;
  final double? averagePrice;
  final double? cost;
  final double? marketValue;
  final double? pnl;
  final double? pnlPercentage;

  PositionResponse({
    this.instrument,
    this.quantity,
    this.averagePrice,
    this.cost,
    this.marketValue,
    this.pnl,
    this.pnlPercentage,
  });

  factory PositionResponse.fromJson(Map<String, dynamic> json) =>
      _$PositionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PositionResponseToJson(this);
}
