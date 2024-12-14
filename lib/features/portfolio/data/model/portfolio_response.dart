import 'package:json_annotation/json_annotation.dart';

import 'balance_response.dart';
import 'position_response.dart';

part 'portfolio_response.g.dart';

@JsonSerializable()
class PortfolioResponse {
  final BalanceResponse? balance;
  final List<PositionResponse>? positions;

  PortfolioResponse({this.balance, this.positions});

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) => _$PortfolioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PortfolioResponseToJson(this);
}