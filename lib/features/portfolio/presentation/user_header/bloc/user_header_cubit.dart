import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/config/language.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/get_locale_use_case.dart';
import 'package:tracking_stocks/core/localization/domain/use_case/save_locale_use_case.dart';
import 'package:equatable/equatable.dart';


part 'user_header_state.dart';

@injectable
class UserHeaderCubit extends Cubit<UserHeaderState> {
  final GetLocaleUseCase _getLocaleUseCase;
  final SaveLocaleUseCase _saveLocaleUseCase;

  UserHeaderCubit(this._getLocaleUseCase, this._saveLocaleUseCase)
      : super(UserHeaderInitial()) {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final savedLanguageCode = await _getLocaleUseCase.execute();
    emit(UserHeaderLoaded(languageCode: savedLanguageCode));
  }

  Future<void> saveLanguage(Language language) async {
    await _saveLocaleUseCase.execute(language.code);
  }
}
