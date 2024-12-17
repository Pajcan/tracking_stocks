import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/get_locale_use_case.dart';

@lazySingleton
class LocaleNotifier extends ChangeNotifier {
  final GetLocaleUseCase _getLocaleUseCase;
  Locale _locale = Locale('en');

  LocaleNotifier(this._getLocaleUseCase);

  Locale get locale => _locale;

  Future<void> initialize() async {
    final savedLanguageCode = await _getLocaleUseCase.execute();
    _locale = Locale(savedLanguageCode);
    notifyListeners();
  }

  void setLocale(String languageCode) {
    _locale = Locale(languageCode);
    notifyListeners();
  }
}
