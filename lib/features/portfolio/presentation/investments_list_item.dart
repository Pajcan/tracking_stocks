import 'package:flutter/material.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/investments_ui_model.dart';
import 'package:tracking_stocks/shared_ui/components/text_components.dart';
import 'package:tracking_stocks/shared_ui/theme/app_text_styles.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class InvestmentsListItem extends StatelessWidget {
  const InvestmentsListItem({super.key, required this.investmentsUiModel});

  final InvestmentsUiModel investmentsUiModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.backgroundPrimary,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InstrumentComponent(instrument: investmentsUiModel.instrument),
            const SizedBox(width: 16),
            PositionComponent(position: investmentsUiModel.position),
          ],
        ),
      ),
    );
  }
}

class InstrumentComponent extends StatelessWidget {
  const InstrumentComponent({super.key, required this.instrument});

  final InstrumentUiModel instrument;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(instrument.ticker, style: AppTextStyles.labelLarge),
        const SizedBox(height: 8),
        CurrencyWithPriceText(
            currency: instrument.currency, price: instrument.lastTradePrice),
        const SizedBox(height: 8),
        Text(instrument.name,
            style: AppTextStyles.bodySmall
                .copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        Text(instrument.exchange,
            style: AppTextStyles.bodySmall
                .copyWith(color: AppColors.textSecondary)),
      ],
    );
  }
}

class PositionComponent extends StatelessWidget {
  const PositionComponent({super.key, required this.position});

  final PositionUiModel position;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PriceWithPercentageText(
          balance: position.pnl,
          percentage: position.pnlPercentage,
          style: AppTextStyles.labelMedium,
        ),
        const SizedBox(height: 8),
        PositionCostText(
            quantity: position.quantity,
            averagePrice: position.averagePrice,
            costs: position.costs),
        const SizedBox(height: 8),
        Text(position.marketValue, style: AppTextStyles.labelMedium),
      ],
    );
  }
}
