import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tracking_stocks/app/di/injector.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/get_porftolio_use_case.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_screen.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrackingStocksApp extends StatefulWidget {
  const TrackingStocksApp({super.key});

  @override
  State<TrackingStocksApp> createState() => _TrackingStocksAppState();
}

class _TrackingStocksAppState extends State<TrackingStocksApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PortfolioBloc>(
            create: (context) => PortfolioBloc(
                  getIt<GetPortfolioUseCase>(),
                  getIt<PortfolioUiMapper>(),
                )),
      ],
      child: MaterialApp(
        title: 'Tracking Stocks',
        locale: const Locale('en'),
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const PortfolioScreen(),
      ),
    );
  }
}
