import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus/model/bus_model.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class AlarmState extends Equatable {
  final LoadingStatus getBusStopModelLoadingStatus;
  final LoadingStatus getTransitBusListLoadingStatus;

  final BusStopModel busStopModel;

  final List<BusModel> transitBusList;

  final List<BusModel> selectedBusList;

  final String selectedAlarmType;

  final bool isAm;

  const AlarmState({
    required this.getBusStopModelLoadingStatus,
    required this.getTransitBusListLoadingStatus,
    required this.busStopModel,
    required this.transitBusList,
    required this.selectedBusList,
    required this.selectedAlarmType,
    required this.isAm,
  });

  AlarmState.init()
      : getBusStopModelLoadingStatus = LoadingStatus.none,
        getTransitBusListLoadingStatus = LoadingStatus.none,
        busStopModel = const BusStopModel.init(),
        transitBusList = <BusModel>[],
        selectedBusList = <BusModel>[],
        selectedAlarmType = '',
        isAm = true;

  AlarmState copyWith({
    LoadingStatus? getBusStopModelLoadingStatus,
    LoadingStatus? getTransitBusListLoadingStatus,
    BusStopModel? busStopModel,
    List<BusModel>? transitBusList,
    List<BusModel>? selectedBusList,
    String? selectedAlarmType,
    bool? isAm,
  }) =>
      AlarmState(
        getBusStopModelLoadingStatus:
            getBusStopModelLoadingStatus ?? this.getBusStopModelLoadingStatus,
        getTransitBusListLoadingStatus: getTransitBusListLoadingStatus ??
            this.getTransitBusListLoadingStatus,
        busStopModel: busStopModel ?? this.busStopModel,
        transitBusList: transitBusList ?? this.transitBusList,
        selectedBusList: selectedBusList ?? this.selectedBusList,
        selectedAlarmType: selectedAlarmType ?? this.selectedAlarmType,
        isAm: isAm ?? this.isAm,
      );

  @override
  List<Object> get props => <Object>[
        getBusStopModelLoadingStatus,
        getTransitBusListLoadingStatus,
        busStopModel,
        transitBusList,
        selectedBusList,
        selectedAlarmType,
        isAm,
      ];
}
