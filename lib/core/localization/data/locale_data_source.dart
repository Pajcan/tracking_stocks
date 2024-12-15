import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocaleDataSource {
  static const String _languageKey = 'app_language';

  final SharedPreferencesAsync _sharedPreferences;

  LocaleDataSource(this._sharedPreferences);

  Future<String?> getLanguage() async {
    return _sharedPreferences.getString(_languageKey);
  }

  Future<void> saveLanguage(String languageCode) async {
    await _sharedPreferences.setString(_languageKey, languageCode);
  }
}
