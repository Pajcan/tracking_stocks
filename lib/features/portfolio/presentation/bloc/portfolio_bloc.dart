import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_stocks/features/portfolio/domain/use_case/get_porftolio_use_case.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/mapper/porfolio_ui_mapper.dart';
import 'package:tracking_stocks/features/portfolio/presentation/ui_model/porfolio_ui_model.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

@injectable
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioUseCase _getPortfolioUseCase;
  final PortfolioUiMapper _portfolioUiMapper;

  PortfolioBloc(this._getPortfolioUseCase, this._portfolioUiMapper)
      : super(PortfolioInitial()) {
    on<PortfolioSubscribe>((event, emit) async {
      emit(PortfolioLoading());
      await emit.onEach(
        _getPortfolioUseCase.execute(),
        onData: (data) {
          final portfolioUiModel = _portfolioUiMapper.map(data);
          emit(PortfolioLoaded(portfolioUiModel: portfolioUiModel));
        },
        onError: (error, stackTrace) {
          emit(PortfolioError());
        },
      );
    });
  }
}
