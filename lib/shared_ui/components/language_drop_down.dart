import 'package:flutter/material.dart';
import 'package:tracking_stocks/core/config/language.dart';

class LanguageDropdown extends StatefulWidget {
  final Language initialLanguage;
  final List<Language> languages;
  final ValueChanged<Language> onLanguageSelected;

  const LanguageDropdown({
    super.key,
    required this.initialLanguage,
    required this.languages,
    required this.onLanguageSelected,
  });

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  late Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage =
        widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      items: widget.languages.map((Language lang) {
        return DropdownMenuItem<Language>(
          value: lang,
          child: Text(lang.abbreviation),
        );
      }).toList(),
      onChanged: (Language? newLang) {
        if (newLang != null) {
          setState(() {
            selectedLanguage = newLang;
          });
          widget.onLanguageSelected(newLang);
        }
      },
    );
  }
}
