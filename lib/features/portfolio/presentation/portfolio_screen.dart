import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_section.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/exception_util.dart';
import 'package:tracking_stocks/features/portfolio/presentation/user_header/user_header.dart';
import 'package:tracking_stocks/shared_ui/components/error_screen.dart';
import 'package:tracking_stocks/shared_ui/components/loading_components.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserHeader(),
          Expanded(
            child: BlocBuilder<PortfolioBloc, PortfolioState>(
              builder: (context, state) {
                return switch (state) {
                  PortfolioInitial() => SizedBox(),
                  PortfolioLoading() => const AppLoader(),
                  PortfolioLoaded() =>
                    PortfolioSection(portfolioUiModel: state.portfolioUiModel),
                  PortfolioError() => ErrorComponent(
                      errorMessage: state.errorType.toLocalizedMessage(context),
                      onRetry: () => context
                          .read<PortfolioBloc>()
                          .add(PortfolioSubscribe())),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
