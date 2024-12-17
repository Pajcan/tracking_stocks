import 'package:json_annotation/json_annotation.dart';

import 'balance_response.dart';
import 'position_response.dart';

part 'portfolio_response.g.dart';

@JsonSerializable()
class PortfolioResponse {
  final PortfolioContentResponse? portfolio;

  PortfolioResponse({this.portfolio});

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioResponseToJson(this);
}

@JsonSerializable()
class PortfolioContentResponse {
  final BalanceResponse? balance;
  final List<PositionResponse>? positions;

  PortfolioContentResponse({this.balance, this.positions});

  factory PortfolioContentResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioContentResponseToJson(this);
}
