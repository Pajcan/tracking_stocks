import 'package:flutter/material.dart';
import 'package:tracking_stocks/features/portfolio/presentation/investments_list_item.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_header.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key, required this.portfolioUiModel});

  final PortfolioUiModel portfolioUiModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PortfolioHeader(userBalance: portfolioUiModel.userBalance),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: portfolioUiModel.investments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InvestmentsListItem(
                  investmentsUiModel: portfolioUiModel.investments[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
