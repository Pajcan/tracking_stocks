import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_stocks/core/constants/app_constants.dart';
import 'package:tracking_stocks/core/constants/icons.dart';
import 'package:tracking_stocks/shared_ui/theme/app_text_styles.dart';

class UserHeaderComponent extends StatelessWidget {
  const UserHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(SvgIcons.userPlaceholder, width: 32, height: 32),
        const SizedBox(width: 16),
        Text(
          AppConstants.userPlaceholderName,
          style: AppTextStyles.labelLarge,
        ),
        Spacer(),
        // TODO: Implement language switcher
        Text("EN")
      ],
    );
  }
}
