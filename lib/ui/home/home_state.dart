import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class HomeState extends Equatable {
  final LoadingStatus getExpectedBusArrivalInfoloadingStatus;
  final LoadingStatus getBusStopList;
  final List<BusStopModel> busStopList;
  final String keyword;

  const HomeState({
    required this.getExpectedBusArrivalInfoloadingStatus,
    required this.getBusStopList,
    required this.busStopList,
    required this.keyword,
  });

  HomeState.init()
      : getExpectedBusArrivalInfoloadingStatus = LoadingStatus.none,
        getBusStopList = LoadingStatus.none,
        busStopList = <BusStopModel>[],
        keyword = '';

  HomeState copyWith({
    LoadingStatus? getExpectedBusArrivalInfoloadingStatus,
    LoadingStatus? getBusStopList,
    List<BusStopModel>? busStopList,
    String? keyword,
  }) =>
      HomeState(
        getExpectedBusArrivalInfoloadingStatus:
            getExpectedBusArrivalInfoloadingStatus ??
                this.getExpectedBusArrivalInfoloadingStatus,
        getBusStopList: getBusStopList ?? this.getBusStopList,
        busStopList: busStopList ?? this.busStopList,
        keyword: keyword ?? this.keyword,
      );

  @override
  List<Object> get props => <Object>[
        getExpectedBusArrivalInfoloadingStatus,
        getBusStopList,
        busStopList,
        keyword,
      ];
}
