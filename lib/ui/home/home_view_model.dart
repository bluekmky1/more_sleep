import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
    state: const HomeState.init(),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({
    required HomeState state,
  }) : super(state);

  // Future<void> getBusStop({required String keyword}) async {
  //   state = state.copyWith(getBusStopList: LoadingStatus.loading);
  //   final UseCaseResult<List<BusStopModel>> result =
  //       await _getBusStopListUseCase(keyword: keyword);
  //   switch (result) {
  //     case SuccessUseCaseResult<List<BusStopModel>>():
  //       state = state.copyWith(
  //         getBusStopList: LoadingStatus.success,
  //         busStopList: result.data,
  //       );
  //     case FailureUseCaseResult<List<BusStopModel>>():
  //       state = state.copyWith(
  //         getBusStopList: LoadingStatus.error,
  //         busStopList: <BusStopModel>[],
  //       );
  //   }
  // }
}
