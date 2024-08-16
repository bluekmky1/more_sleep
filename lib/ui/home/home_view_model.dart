import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/use_case/use_case_result.dart';
import '../../core/loading_status.dart';
import '../../domain/bus_stop/get_bus_stop_list_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
      state: HomeState.init(),
      getBusStopListUseCase: ref.watch(getBusStopListUseCaseProvider)),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final GetBusStopListUseCase _getBusStopListUseCase;
  HomeViewModel(
      {required HomeState state,
      required GetBusStopListUseCase getBusStopListUseCase})
      : _getBusStopListUseCase = getBusStopListUseCase,
        super(state);

  Future<void> getBusStop({required String keyword}) async {
    state = state.copyWith(
      searchBusStopListLoadingStatus: LoadingStatus.loading,
    );

    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListUseCase(keyword: keyword);
    switch (result) {
      case SuccessUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          searchBusStopListLoadingStatus: LoadingStatus.success,
          searchedBusStopList: result.data,
        );
      case FailureUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          searchBusStopListLoadingStatus: LoadingStatus.error,
          searchedBusStopList: <BusStopModel>[],
        );
    }
  }
}
