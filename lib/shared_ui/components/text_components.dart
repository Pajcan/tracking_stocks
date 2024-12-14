import 'package:flutter/material.dart';
import 'package:tracking_stocks/shared_ui/theme/app_text_styles.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class PriceWithPercentageText extends StatelessWidget {
  const PriceWithPercentageText({
    super.key,
    required this.balance,
    required this.percentage,
    this.style = AppTextStyles.labelMedium,
  });

  final String balance;
  final double percentage;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final String percentageText = percentage >= 0
        ? "+${percentage.toStringAsFixed(1)}%"
        : "-${percentage.toStringAsFixed(1)}%";
    final Color percentageColor = percentage >= 0 ? Colors.green : Colors.red;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(balance, style: style),
        const SizedBox(width: 4),
        RichText(
          text: TextSpan(children: [
            // Opening parenthesis (black)
            TextSpan(
              text: "(",
              style: style,
            ),
            TextSpan(
              text: percentageText,
              style: style.copyWith(
                color: percentageColor,
              ),
            ),
            TextSpan(
              text: ")",
              style: style,
            ),
          ]),
        )
      ],
    );
  }
}

class CurrencyWithPriceText extends StatelessWidget {
  const CurrencyWithPriceText({
    super.key,
    required this.currency,
    required this.price,
  });

  final String currency;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          currency,
          style: AppTextStyles.bodyMedium,
        ),
        Text(
          price,
          style: AppTextStyles.labelMedium,
        ),
      ],
    );
  }
}

class PositionCostText extends StatelessWidget {
  const PositionCostText(
      {super.key,
      required this.quantity,
      required this.averagePrice,
      required this.costs});

  final String quantity;
  final String averagePrice;
  final String costs;

  @override
  Widget build(BuildContext context) {
    return Text("$quantity x $averagePrice = $costs",
        style: AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary));
  }
}
