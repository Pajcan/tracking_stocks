import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Language extends Equatable {
  final String code;
  final String name;
  final String abbreviation;

  Language(
      {required this.code, required this.name, required this.abbreviation});

  @override
  List<Object?> get props => [code, name, abbreviation];
}

List<Language> getSupportedLanguages(BuildContext context) {
  final localizations = AppLocalizations.of(context);

  return [
    Language(
        code: 'en',
        name: localizations?.languageEnglish ?? 'English',
        abbreviation: 'EN'),
    Language(
        code: 'ar',
        name: localizations?.languageArabic ?? 'العربية',
        abbreviation: 'AR'),
  ];
}
