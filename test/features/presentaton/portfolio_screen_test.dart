import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_screen.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_section.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';
import 'package:tracking_stocks/features/portfolio/presentation/user_header/bloc/user_header_cubit.dart';
import 'package:tracking_stocks/shared_ui/components/error_screen.dart';
import 'package:tracking_stocks/shared_ui/components/loading_components.dart';

import 'portfolio_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PortfolioBloc>(), MockSpec<UserHeaderCubit>()])
void main() {
  late MockPortfolioBloc mockPortfolioBloc;
  late MockUserHeaderCubit mockUserHeaderCubit;

  setUpAll(() {
    provideDummy<PortfolioState>(PortfolioInitial());
    provideDummy<UserHeaderState>(UserHeaderInitial());
  });

  setUp(() {
    mockPortfolioBloc = MockPortfolioBloc();
    mockUserHeaderCubit = MockUserHeaderCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PortfolioBloc>(
            create: (_) => mockPortfolioBloc,
          ),
          BlocProvider<UserHeaderCubit>(
            create: (_) => mockUserHeaderCubit,
          ),
        ],
        child: PortfolioScreen(),
      ),
    );
  }

  testWidgets('displays AppLoader when state is PortfolioLoading',
      (WidgetTester tester) async {
    when(mockPortfolioBloc.state).thenReturn(PortfolioLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(AppLoader), findsOneWidget);
  });

  testWidgets('displays PortfolioSection when state is PortfolioLoaded',
      (WidgetTester tester) async {
    final portfolioUiModel = PortfolioUiModel(
      userBalance: UserBalanceUiModel(
        netValue: '32432.54',
        pnl: '10332.55',
        pnlPercentage: 31.52,
      ),
      investments: [],
    );

    when(mockPortfolioBloc.state)
        .thenReturn(PortfolioLoaded(portfolioUiModel: portfolioUiModel));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(PortfolioSection), findsOneWidget);
  });

  testWidgets('displays ErrorComponent when state is PortfolioError',
      (WidgetTester tester) async {
    when(mockPortfolioBloc.state).thenReturn(PortfolioError(PortfolioErrorType.noInternetConnection));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ErrorComponent), findsOneWidget);
  });

  testWidgets('displays nothing when state is PortfolioInitial',
      (WidgetTester tester) async {
    when(mockPortfolioBloc.state).thenReturn(PortfolioInitial());

    await tester.pumpWidget(SizedBox());

    expect(find.byType(SizedBox), findsOneWidget);
  });
}
