import 'package:flutter/material.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';
import 'package:tracking_stocks/shared_ui/components/text_components.dart';
import 'package:tracking_stocks/shared_ui/components/user_header_component.dart';
import 'package:tracking_stocks/shared_ui/theme/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';
import 'package:tracking_stocks/shared_ui/theme/gradients.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key, required this.userBalance});

  final UserBalanceUiModel userBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppGradients.primaryLabelGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          UserHeaderComponent(),
          const SizedBox(height: 16),
          UserBalanceComponent(userBalance: userBalance),
        ],
      ),
    );
  }
}

class UserBalanceComponent extends StatelessWidget {
  const UserBalanceComponent({super.key, required this.userBalance});

  final UserBalanceUiModel userBalance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(userBalance.netValue, style: AppTextStyles.labelLarge),
            PriceWithPercentageText(
                balance: userBalance.pnl,
                percentage: userBalance.pnlPercentage),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.netValue,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textSecondary),
            ),
            Text(
              AppLocalizations.of(context)!.pnl,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
