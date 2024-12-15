import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_stocks/core/config/language.dart';
import 'package:tracking_stocks/core/constants/app_constants.dart';
import 'package:tracking_stocks/core/constants/icons.dart';
import 'package:tracking_stocks/core/utils/language_utls.dart';
import 'package:tracking_stocks/features/portfolio/presentation/user_header/bloc/user_header_cubit.dart';
import 'package:tracking_stocks/shared_ui/components/LanguageDropDown.dart';
import 'package:tracking_stocks/shared_ui/theme/app_text_styles.dart';
import 'package:tracking_stocks/shared_ui/theme/gradients.dart';


class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        gradient: AppGradients.primaryLabelGradient,
      ),
      child: Row(
        children: [
          SvgPicture.asset(SvgIcons.userPlaceholder, width: 32, height: 32),
          const SizedBox(width: 16),
          Text(
            AppConstants.userPlaceholderName,
            style: AppTextStyles.labelLarge,
          ),
          Spacer(),
          BlocBuilder<UserHeaderCubit, UserHeaderState>(
            builder: (context, state) {
              return switch (state) {
                UserHeaderInitial() => const SizedBox(),
                UserHeaderLoaded() => LanguageDropdown(
                    initialLanguage:
                        LanguageUtils.getLanguageFromCode(context, state.languageCode),
                    languages: getSupportedLanguages(context),
                    onLanguageSelected: (language) =>
                        context.read<UserHeaderCubit>().saveLanguage(language)),
              };
            },
          ),
        ],
      ),
    );
  }
}
