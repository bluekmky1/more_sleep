import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class AlarmState extends Equatable {
  final LoadingStatus loadingStatus;

  final List<BusStopModel> busStopList;

  const AlarmState({
    required this.loadingStatus,
    required this.busStopList,
  });

  AlarmState.init()
      : loadingStatus = LoadingStatus.none,
        busStopList = <BusStopModel>[];

  AlarmState copyWith({
    LoadingStatus? loadingStatus,
    List<BusStopModel>? busStopList,
  }) =>
      AlarmState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        busStopList: busStopList ?? this.busStopList,
      );

  @override
  List<Object> get props => <Object>[
        loadingStatus,
        busStopList,
      ];
}
