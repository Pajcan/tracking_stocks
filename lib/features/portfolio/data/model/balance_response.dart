import 'package:json_annotation/json_annotation.dart';

part 'balance_response.g.dart';

@JsonSerializable()
class BalanceResponse {
  final double? netValue;
  final double? pnl;
  final double? pnlPercentage;

  BalanceResponse({this.netValue, this.pnl, this.pnlPercentage});

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);
}
