import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/use_case/use_case_result.dart';
import '../../core/loading_status.dart';
import '../../domain/bus_stop/get_bus_stop_list_by_bounds_use_case.dart';
import '../../domain/bus_stop/get_bus_stop_list_by_stop_name_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
    state: HomeState.init(),
    getBusStopListByStopNameUseCase:
        ref.watch(getBusStopListByStopNameUseCaseProvider),
    getBusStopListByBoundsUseCase: ref.watch(getBusStopListByBoundsUseCase),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final GetBusStopListByStopNameUseCase _getBusStopListByStopNameUseCase;
  final GetBusStopListByBoundsUseCase _getBusStopListByBoundsUseCase;
  HomeViewModel({
    required HomeState state,
    required GetBusStopListByStopNameUseCase getBusStopListByStopNameUseCase,
    required GetBusStopListByBoundsUseCase getBusStopListByBoundsUseCase,
  })  : _getBusStopListByStopNameUseCase = getBusStopListByStopNameUseCase,
        _getBusStopListByBoundsUseCase = getBusStopListByBoundsUseCase,
        super(state);

  Future<void> getBusStopByStopName({required String keyword}) async {
    state = state.copyWith(
      searchBusStopListLoadingStatus: LoadingStatus.loading,
    );

    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListByStopNameUseCase(keyword: keyword);
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

  Future<void> getBusStopByBounds({
    required double startLat,
    required double startLong,
    required double endLat,
    required double endLong,
  }) async {
    state = state.copyWith(
      getBusStopListLoadingStatus: LoadingStatus.loading,
    );

    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListByBoundsUseCase(
      startLat: startLat,
      startLong: startLong,
      endLat: endLat,
      endLong: endLong,
    );
    switch (result) {
      case SuccessUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          getBusStopListLoadingStatus: LoadingStatus.success,
          diplayedBusStopList: result.data,
        );
      case FailureUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          getBusStopListLoadingStatus: LoadingStatus.error,
        );
    }
  }

  void clearDiplayedBusStop() {
    state = state.copyWith(
      diplayedBusStopList: <BusStopModel>[],
    );
  }

  void selectBusStop({required BusStopModel busStopModel}) {
    state = state.copyWith(
      selectBusStopModel: busStopModel,
    );
  }
}
