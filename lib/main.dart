import 'package:flutter/material.dart';
import 'package:tracking_stocks/app/app.dart';
import 'package:tracking_stocks/core/localization/presentation/locale_notifier.dart';

import 'app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final localeNotifier = getIt<LocaleNotifier>();
  await localeNotifier.initialize();

  runApp(TrackingStocksApp(localeNotifier: localeNotifier));
}
