import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class HomeState extends Equatable {
  final LoadingStatus loadingStatus;

  final List<BusStopModel> busStopList;

  const HomeState({
    required this.loadingStatus,
    required this.busStopList,
  });

  HomeState.init()
      : loadingStatus = LoadingStatus.none,
        busStopList = <BusStopModel>[];

  HomeState copyWith({
    LoadingStatus? loadingStatus,
    List<BusStopModel>? busStopList,
  }) =>
      HomeState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        busStopList: busStopList ?? this.busStopList,
      );

  @override
  List<Object> get props => <Object>[
        loadingStatus,
        busStopList,
      ];
}
