import 'package:flutter/material.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class AppGradients {

  static final primaryLabelGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.primary,
      AppColors.secondary,
    ],
  );
}