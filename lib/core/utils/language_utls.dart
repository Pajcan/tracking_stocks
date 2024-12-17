import 'package:flutter/material.dart';
import 'package:tracking_stocks/core/config/language.dart';

class LanguageUtils {
  static Language getLanguageFromCode(BuildContext context, String code) {
    final supportedLanguages = getSupportedLanguages(context);
    return supportedLanguages.firstWhere(
      (language) => language.code == code,
      orElse: () => supportedLanguages.first,
    );
  }
}
