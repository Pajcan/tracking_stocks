import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tracking_stocks/app/di/injector.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/get_locale_use_case.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/save_locale_use_case.dart';
import 'package:tracking_stocks/core/localization/presentation/locale_notifier.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/observe_portfolio_use_case.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_screen.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_stocks/features/portfolio/presentation/user_header/bloc/user_header_cubit.dart';

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
    return ChangeNotifierProvider<LocaleNotifier>.value(
        value: localeNotifier,

        child: Consumer<LocaleNotifier>(
        builder: (context, notifier, child)
    {
      return MultiBlocProvider(
        providers: [
          BlocProvider<PortfolioBloc>(
              create: (context) =>
                  PortfolioBloc(
                    getIt<GetPortfolioUseCase>(),
                    getIt<PortfolioUiMapper>(),
                  )),
          BlocProvider<UserHeaderCubit>(
              create: (context) =>
                  UserHeaderCubit(
                    getIt<GetLocaleUseCase>(),
                    getIt<SaveLocaleUseCase>(),
                    localeNotifier,
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
    }),
    );
  }
}
