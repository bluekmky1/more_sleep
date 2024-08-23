import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus/model/bus_model.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class AlarmState extends Equatable {
  final LoadingStatus getBusStopModelLoadingStatus;
  final LoadingStatus getTransitBusListLoadingStatus;

  final BusStopModel busStopModel;

  final List<BusModel> transitBusList;

  const AlarmState({
    required this.getBusStopModelLoadingStatus,
    required this.getTransitBusListLoadingStatus,
    required this.busStopModel,
    required this.transitBusList,
  });

  AlarmState.init()
      : getBusStopModelLoadingStatus = LoadingStatus.none,
        getTransitBusListLoadingStatus = LoadingStatus.none,
        busStopModel = const BusStopModel.init(),
        transitBusList = <BusModel>[];

  AlarmState copyWith({
    LoadingStatus? getBusStopModelLoadingStatus,
    LoadingStatus? getTransitBusListLoadingStatus,
    BusStopModel? busStopModel,
    List<BusModel>? transitBusList,
  }) =>
      AlarmState(
        getBusStopModelLoadingStatus:
            getBusStopModelLoadingStatus ?? this.getBusStopModelLoadingStatus,
        getTransitBusListLoadingStatus: getTransitBusListLoadingStatus ??
            this.getTransitBusListLoadingStatus,
        busStopModel: busStopModel ?? this.busStopModel,
        transitBusList: transitBusList ?? this.transitBusList,
      );

  @override
  List<Object> get props => <Object>[
        getBusStopModelLoadingStatus,
        getTransitBusListLoadingStatus,
        busStopModel,
        transitBusList,
      ];
}
