import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus/get_expected_bus_arrival_info_use_case.dart';
import '../../domain/bus/model/bus_arrival_info_model.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
    state: const HomeState.init(),
    getExpectedBusArrivalInfoUseCase:
        ref.watch(getExpectedBusArrivalInfoUseCaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final GetExpectedBusArrivalInfoUseCase _getExpectedBusArrivalInfoUseCase;
  HomeViewModel({
    required HomeState state,
    required GetExpectedBusArrivalInfoUseCase getExpectedBusArrivalInfoUseCase,
  })  : _getExpectedBusArrivalInfoUseCase = getExpectedBusArrivalInfoUseCase,
        super(state);

  Future<void> getExpectedBusArrivalInfo() async {
    state = state.copyWith(
      getExpectedBusArrivalInfoloadingStatus: LoadingStatus.loading,
    );

    final UseCaseResult<BusArrivalInfoModel> result =
        await _getExpectedBusArrivalInfoUseCase(
      nodeId: 'GGB209000099',
      routeId: 'GGB208000008',
    );
    switch (result) {
      case SuccessUseCaseResult<BusArrivalInfoModel>():
        state = state.copyWith(
          getExpectedBusArrivalInfoloadingStatus: LoadingStatus.success,
        );
      case FailureUseCaseResult<BusArrivalInfoModel>():
        state = state.copyWith(
          getExpectedBusArrivalInfoloadingStatus: LoadingStatus.error,
        );
    }
  }
}
