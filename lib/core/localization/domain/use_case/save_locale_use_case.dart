import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/localization/domain/localization_repository.dart';
import 'package:tracking_stocks/core/use_case/use_case.dart';

@injectable
class SaveLocaleUseCase extends UseCase<Future<void>, String> {
  final LocalizationRepository _repository;

  SaveLocaleUseCase(this._repository);

  @override
  Future<void> execute(String params) {
    return _repository.saveLocale(params);
  }
}
