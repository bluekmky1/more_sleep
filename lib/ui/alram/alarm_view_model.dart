import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/use_case/use_case_result.dart';
import '../../core/loading_status.dart';
import '../../domain/bus/get_transit_bus_by_bus_stop_id_use_case.dart';
import '../../domain/bus/model/bus_model.dart';
import '../../domain/bus_stop/get_bus_stop_by_stop_id_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'alarm_state.dart';

final AutoDisposeStateNotifierProvider<AlarmViewModel, AlarmState>
    alarmViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<AlarmState> ref) => AlarmViewModel(
    state: AlarmState.init(),
    getBusStopByStopIdUseCase: ref.watch(getBusStopByStopIdUseCaseProvider),
    getTransitBusByBusStopIdUseCase:
        ref.watch(getTransitBusByBusStopIdUseCaseProvider),
  ),
);

class AlarmViewModel extends StateNotifier<AlarmState> {
  final GetBusStopByStopIdUseCase _getBusStopByStopIdUseCase;
  final GetTransitBusByBusStopIdUseCase _getTransitBusByBusStopIdUseCase;
  AlarmViewModel({
    required AlarmState state,
    required GetBusStopByStopIdUseCase getBusStopByStopIdUseCase,
    required GetTransitBusByBusStopIdUseCase getTransitBusByBusStopIdUseCase,
  })  : _getBusStopByStopIdUseCase = getBusStopByStopIdUseCase,
        _getTransitBusByBusStopIdUseCase = getTransitBusByBusStopIdUseCase,
        super(state);

  Future<void> getBusStopModel({required String stopId}) async {
    state = state.copyWith(getBusStopModelLoadingStatus: LoadingStatus.loading);
    final UseCaseResult<BusStopModel> result =
        await _getBusStopByStopIdUseCase(stopId: stopId);
    switch (result) {
      case SuccessUseCaseResult<BusStopModel>():
        state = state.copyWith(
          getBusStopModelLoadingStatus: LoadingStatus.success,
          busStopModel: result.data,
        );
      case FailureUseCaseResult<BusStopModel>():
        state = state.copyWith(
          getBusStopModelLoadingStatus: LoadingStatus.error,
        );
    }
  }

  // 정류소 별 경유 노선 정보 조회
  Future<void> getTransitBusByBusStopId(
      {required String stopId, required String cityCode}) async {
    state = state.copyWith(getBusStopModelLoadingStatus: LoadingStatus.loading);
    final UseCaseResult<List<BusModel>> result =
        await _getTransitBusByBusStopIdUseCase(
            nodeId: stopId, cityCode: cityCode);
    switch (result) {
      case SuccessUseCaseResult<List<BusModel>>():
        state = state.copyWith(
          getBusStopModelLoadingStatus: LoadingStatus.success,
          transitBusList: result.data,
        );
      case FailureUseCaseResult<List<BusModel>>():
        state = state.copyWith(
          getBusStopModelLoadingStatus: LoadingStatus.error,
        );
    }
  }
}
