import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/get_locale_use_case.dart';

@singleton
class LocaleNotifier extends ChangeNotifier {
  final GetLocaleUseCase _getLocaleUseCase;
  Locale _locale = Locale('en');

  LocaleNotifier(this._getLocaleUseCase);

  Locale get locale => _locale;
  final StreamController<Locale> _localeController =
      StreamController<Locale>.broadcast();

  Stream<Locale> get localeStream => _localeController.stream;

  Future<void> initialize() async {
    final savedLanguageCode = await _getLocaleUseCase.execute();
    _locale = Locale(savedLanguageCode);
    notifyListeners();
  }

  // Method to set the locale (change language)
  void setLocale(Locale newLocale) {
    _localeController.add(newLocale);
  }

  // Dispose of the stream when it's no longer needed
  void dispose() {
    _localeController.close();
  }
}
