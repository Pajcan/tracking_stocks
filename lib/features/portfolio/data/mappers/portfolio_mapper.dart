import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/features/portfolio/data/model/balance_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/instrument_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/portfolio_response.dart';
import 'package:tracking_stocks/features/portfolio/data/model/position_response.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/balance.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/instrument.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/position.dart';

@lazySingleton
class PortfolioMapper {
  Portfolio mapToDomain(PortfolioResponse response) {
    return Portfolio(
      balance: mapBalance(response.balance),
      positions: response.positions?.map(mapPosition).toList() ?? [],
    );
  }

  Balance mapBalance(BalanceResponse? response) {
    return Balance(
      netValue: response?.netValue ?? 0.0,
      pnl: response?.pnl ?? 0.0,
      pnlPercentage: response?.pnlPercentage ?? 0.0,
    );
  }

  Position mapPosition(PositionResponse response) {
    return Position(
      instrument: mapInstrument(response.instrument),
      quantity: response.quantity ?? 0.0,
      averagePrice: response.averagePrice ?? 0.0,
      cost: response.cost ?? 0.0,
      marketValue: response.marketValue ?? 0.0,
      pnl: response.pnl ?? 0.0,
      pnlPercentage: response.pnlPercentage ?? 0.0,
    );
  }

  Instrument mapInstrument(InstrumentResponse? response) {
    return Instrument(
      ticker: response?.ticker ?? '',
      name: response?.name ?? '',
      exchange: response?.exchange ?? '',
      currency: response?.currency ?? '',
      lastTradedPrice: response?.lastTradedPrice ?? 0.0,
    );
  }
}
