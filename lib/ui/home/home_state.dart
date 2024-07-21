import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';

class HomeState extends Equatable {
  final LoadingStatus getExpectedBusArrivalInfoloadingStatus;

  const HomeState({
    required this.getExpectedBusArrivalInfoloadingStatus,
  });

  const HomeState.init()
      : getExpectedBusArrivalInfoloadingStatus = LoadingStatus.none;

  HomeState copyWith({
    LoadingStatus? getExpectedBusArrivalInfoloadingStatus,
  }) =>
      HomeState(
        getExpectedBusArrivalInfoloadingStatus:
            getExpectedBusArrivalInfoloadingStatus ??
                this.getExpectedBusArrivalInfoloadingStatus,
      );

  @override
  List<Object> get props => <Object>[
        getExpectedBusArrivalInfoloadingStatus,
      ];
}
