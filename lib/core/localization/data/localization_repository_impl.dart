import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/localization/data/locale_data_source.dart';
import 'package:tracking_stocks/core/localization/domain/localization_repository.dart';

@LazySingleton(as: LocalizationRepository)
class LocalizationRepositoryImpl implements LocalizationRepository {
  final LocaleDataSource _dataSource;

  LocalizationRepositoryImpl(this._dataSource);

  @override
  Future<String> getLocale() async {
    return await _dataSource.getLanguage() ?? 'en';
  }

  @override
  Future<void> saveLocale(String locale) async {
    return await _dataSource.saveLanguage(locale);
  }
}
