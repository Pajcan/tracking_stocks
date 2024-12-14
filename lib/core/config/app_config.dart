import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/core/constants/app_constants.dart';

import 'config.dart';

@Injectable(as: IConfig)
class AppConfig extends IConfig {
  @override
  String get baseUrl => AppConstants.baseURL;

  @override
  Map<String, String> get headers => {'Content-Type': 'application/json', 'accept': '*/*'};
}
