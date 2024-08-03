import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus/get_expected_bus_arrival_info_use_case.dart';
import '../../domain/bus/model/bus_arrival_info_model.dart';
import '../../domain/bus_stop/get_bus_stop_list_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
    state: HomeState.init(),
    getExpectedBusArrivalInfoUseCase:
        ref.watch(getExpectedBusArrivalInfoUseCaseProvider),
    getBusStopListUseCase: ref.watch(getBusStopListUseCaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final GetExpectedBusArrivalInfoUseCase _getExpectedBusArrivalInfoUseCase;
  final GetBusStopListUseCase _getBusStopListUseCase;
  HomeViewModel({
    required HomeState state,
    required GetExpectedBusArrivalInfoUseCase getExpectedBusArrivalInfoUseCase,
    required GetBusStopListUseCase getBusStopListUseCase,
  })  : _getExpectedBusArrivalInfoUseCase = getExpectedBusArrivalInfoUseCase,
        _getBusStopListUseCase = getBusStopListUseCase,
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

  Future<void> getBusStop({required String keyword}) async {
    state = state.copyWith(getBusStopList: LoadingStatus.loading);
    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListUseCase(keyword: keyword);
    switch (result) {
      case SuccessUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          getBusStopList: LoadingStatus.success,
          busStopList: result.data,
        );
      case FailureUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          getBusStopList: LoadingStatus.error,
          busStopList: <BusStopModel>[],
        );
    }
  }

  void setKeyword({required String keyword}) {
    state = state.copyWith(keyword: keyword);
  }
}
