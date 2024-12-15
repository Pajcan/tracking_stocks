import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tracking_stocks/app/di/injector.dart';
import 'package:tracking_stocks/core/localization/presentation/locale_notifier.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/get_porftolio_use_case.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_screen.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrackingStocksApp extends StatefulWidget {
  const TrackingStocksApp({super.key, required this.localeNotifier});

  final LocaleNotifier localeNotifier;

  @override
  State<TrackingStocksApp> createState() => _TrackingStocksAppState();
}

class _TrackingStocksAppState extends State<TrackingStocksApp> {
  get localeNotifier => widget.localeNotifier;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      stream: localeNotifier.localeStream,
      builder: (context, snapshot) {
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
            locale: localeNotifier.locale,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
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
    );
  }
}
