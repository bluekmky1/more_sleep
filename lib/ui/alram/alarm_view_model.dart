import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/use_case/use_case_result.dart';
import '../../core/loading_status.dart';
import '../../domain/bus_stop/get_bus_stop_list_use_case.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import 'alarm_state.dart';

final AutoDisposeStateNotifierProvider<AlarmViewModel, AlarmState>
    alarmViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<AlarmState> ref) => AlarmViewModel(
      state: AlarmState.init(),
      getBusStopListUseCase: ref.watch(getBusStopListUseCaseProvider)),
);

class AlarmViewModel extends StateNotifier<AlarmState> {
  final GetBusStopListUseCase _getBusStopListUseCase;
  AlarmViewModel(
      {required AlarmState state,
      required GetBusStopListUseCase getBusStopListUseCase})
      : _getBusStopListUseCase = getBusStopListUseCase,
        super(state);

  Future<void> getBusStop({required String keyword}) async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    final UseCaseResult<List<BusStopModel>> result =
        await _getBusStopListUseCase(keyword: keyword);
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
