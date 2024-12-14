import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/localization/domain/localization_repository.dart';
import 'package:tracking_stocks/core/use_case/use_case.dart';

@injectable
class GetLocaleUseCase extends UseCaseNoParams<Future<String>> {
  final LocalizationRepository _repository;

  GetLocaleUseCase(this._repository);

  @override
  Future<String> execute() {
    return _repository.getLocale();
  }
}
