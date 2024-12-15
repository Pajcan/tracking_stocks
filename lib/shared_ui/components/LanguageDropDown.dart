import 'package:flutter/material.dart';
import 'package:tracking_stocks/core/config/language.dart';

class LanguageDropdown extends StatefulWidget {
  final Language initialLanguage;
  final List<Language> languages;
  final ValueChanged<Language> onLanguageSelected;

  const LanguageDropdown({
    Key? key,
    required this.initialLanguage,
    required this.languages,
    required this.onLanguageSelected,
  }) : super(key: key);

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  late Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage =
        widget.initialLanguage; // Initialize with the provided initial language
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
      value: selectedLanguage,
      items: widget.languages.map((Language lang) {
        return DropdownMenuItem<Language>(
          value: lang,
          child: Text(lang.abbreviation), // Abbreviation, e.g., "EN"
          // Full language name, e.g., "English"
        );
      }).toList(),
      onChanged: (Language? newLang) {
        if (newLang != null) {
          setState(() {
            selectedLanguage = newLang;
          });
          widget.onLanguageSelected(
              newLang); // Notify parent widget of the selected language
        }
      },
    );
  }
}
