import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/use_case/use_case_result.dart';
import '../../core/loading_status.dart';
import '../../domain/bus_stop/get_bus_stop_list_by_stop_name_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'alarm_state.dart';

final AutoDisposeStateNotifierProvider<AlarmViewModel, AlarmState>
    alarmViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<AlarmState> ref) => AlarmViewModel(
      state: AlarmState.init(),
      getBusStopListByStopNameUseCase:
          ref.watch(getBusStopListByStopNameUseCaseProvider)),
);

class AlarmViewModel extends StateNotifier<AlarmState> {
  final GetBusStopListByStopNameUseCase _getBusStopListByStopNameUseCase;
  AlarmViewModel(
      {required AlarmState state,
      required GetBusStopListByStopNameUseCase getBusStopListByStopNameUseCase})
      : _getBusStopListByStopNameUseCase = getBusStopListByStopNameUseCase,
        super(state);

  Future<void> getBusStop({required String keyword}) async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListByStopNameUseCase(keyword: keyword);
    switch (result) {
      case SuccessUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          busStopList: result.data,
        );
      case FailureUseCaseResult<List<BusStopModel>>():
        state = state.copyWith(
          loadingStatus: LoadingStatus.error,
          busStopList: <BusStopModel>[],
        );
    }
  }
}
