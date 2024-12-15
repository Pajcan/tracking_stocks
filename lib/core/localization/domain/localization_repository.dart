abstract class LocalizationRepository {
  Future<String> getLocale();

  Future<void> saveLocale(String locale);
}
