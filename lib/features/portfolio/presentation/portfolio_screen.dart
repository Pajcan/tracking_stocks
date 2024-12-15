import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tracking_stocks/features/portfolio/presentation/portfolio_section.dart';
import 'package:tracking_stocks/shared_ui/components/loading_components.dart';
import 'package:tracking_stocks/shared_ui/components/user_header_component.dart';
import 'package:tracking_stocks/shared_ui/theme/colors.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(PortfolioSubscribe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserHeaderComponent(onLanguageChanged: (language) {
            //context.read<LocaleNotifier>().changeLanguage(language);
          }),
          BlocConsumer<PortfolioBloc, PortfolioState>(
            listener: (context, state) {
              if (state is PortfolioError) {
                //showErrorDialog(context);
              }
            },
            builder: (context, state) {
              return switch (state) {
                PortfolioInitial() => SizedBox(),
                PortfolioLoading() => const AppLoader(),
                PortfolioLoaded() => Expanded(
                    child: PortfolioSection(
                        portfolioUiModel: state.portfolioUiModel)),
                PortfolioError() => const AppLoader(),
              };
            },
          ),
        ],
      ),
    );
  }
}
