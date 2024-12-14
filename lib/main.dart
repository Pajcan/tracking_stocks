import 'package:flutter/material.dart';
import 'package:tracking_stocks/app/app.dart';

import 'app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const TrackingStocksApp());
}
