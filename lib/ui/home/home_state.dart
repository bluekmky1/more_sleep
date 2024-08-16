import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class HomeState extends Equatable {
  final LoadingStatus searchBusStopListLoadingStatus;
  final List<BusStopModel> searchedBusStopList;

  const HomeState({
    required this.searchBusStopListLoadingStatus,
    required this.searchedBusStopList,
  });

  HomeState.init()
      : searchBusStopListLoadingStatus = LoadingStatus.none,
        searchedBusStopList = <BusStopModel>[];

  HomeState copyWith({
    LoadingStatus? searchBusStopListLoadingStatus,
    List<BusStopModel>? searchedBusStopList,
  }) =>
      HomeState(
        searchBusStopListLoadingStatus: searchBusStopListLoadingStatus ??
            this.searchBusStopListLoadingStatus,
        searchedBusStopList: searchedBusStopList ?? this.searchedBusStopList,
      );

  @override
  List<Object> get props => <Object>[
        searchBusStopListLoadingStatus,
        searchedBusStopList,
      ];
}
