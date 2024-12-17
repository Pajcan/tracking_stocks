import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_stocks/core/error/app_exceptions.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';

extension PortfolioErrorTypeExtension on PortfolioErrorType {
  String toLocalizedMessage(BuildContext context) {
    switch (this) {
      case PortfolioErrorType.noInternetConnection:
        return AppLocalizations.of(context)!.noInternetConnection;
      default:
        return AppLocalizations.of(context)!.genericErrorMessage;
    }
  }
}
