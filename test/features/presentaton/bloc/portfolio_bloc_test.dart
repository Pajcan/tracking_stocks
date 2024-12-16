
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/balance.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/instrument.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/portfolio.dart';
import 'package:tracking_stocks/features/portfolio/domain/model/position.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/observe_portfolio_use_case.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/investments_ui_model.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';

import 'portfolio_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ObservePortfolioUseCase>()])
void main() {
  late PortfolioUiMapper portfolioUiMapper;
  late MockObservePortfolioUseCase getPortfolioUseCase;
  late PortfolioBloc portfolioBloc;

  final position = Position(
    instrument: Instrument(
      ticker: 'SXR8',
      name: 'iShares Core S&P 500',
      exchange: 'IBIS',
      currency: 'EUR',
      lastTradedPrice: 611.64,
    ),
    quantity: 8.40,
    averagePrice: 393.77,
    cost: 3307.70,
    marketValue: 5134,
    pnl: 1829.24,
    pnlPercentage: 55.2,
  );

  final portfolio = Portfolio(
    balance: Balance(netValue: 32432.54, pnl: 10332.55, pnlPercentage: 31.52),
    positions: [position, position],
  );

  final investmentsUiModel = InvestmentsUiModel(
    instrument: InstrumentUiModel(
      name: 'iShares Core S&P 500',
      exchange: 'IBIS',
      ticker: 'SXR8',
      currency: 'EUR',
      lastTradePrice: '611.64',
    ),
    position: PositionUiModel(
      pnl: '1829.24',
      pnlPercentage: 55.2,
      quantity: '8.40',
      averagePrice: '393.77',
      costs: '3307.70',
      marketValue: '5134.00',
    ),
  );

  final portfolioUiModel = PortfolioUiModel(
    userBalance: UserBalanceUiModel(
      netValue: '32432.54',
      pnl: '10332.55',
      pnlPercentage: 31.52,
    ),
    investments: [investmentsUiModel, investmentsUiModel],
  );

  setUp(() {
    getPortfolioUseCase = MockObservePortfolioUseCase();
    portfolioUiMapper = PortfolioUiMapper();
    portfolioBloc = PortfolioBloc(getPortfolioUseCase, portfolioUiMapper);
  });


  blocTest<PortfolioBloc, PortfolioState>(
    'emits [PortfolioLoading, PortfolioLoaded] when PortfolioSubscribe is added and data is received',
    build: () {
      when(getPortfolioUseCase.execute()).thenAnswer((_) => Stream.value(portfolio));
      return portfolioBloc;
    },
    act: (bloc) => bloc.add(PortfolioSubscribe()),
    expect: () => <PortfolioState>[
      PortfolioLoaded(portfolioUiModel: portfolioUiModel),
    ],
  );

  blocTest<PortfolioBloc, PortfolioState>(
    'emits [PortfolioLoading, PortfolioError] when PortfolioSubscribe is added and an error occurs',
    build: () {
      when(getPortfolioUseCase.execute()).thenAnswer((_) => Stream.error(NetworkException()));
      return portfolioBloc;
    },
    act: (bloc) => bloc.add(PortfolioSubscribe()),
    expect: () => <PortfolioState>[
      PortfolioError(),
    ],
  );


}