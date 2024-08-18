import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';

class HomeState extends Equatable {
  final LoadingStatus searchBusStopListLoadingStatus;
  final List<BusStopModel> searchedBusStopList;
  final LoadingStatus getBusStopListLoadingStatus;
  final List<BusStopModel> diplayedBusStopList;

  final BusStopModel selectBusStopModel;

  const HomeState({
    required this.searchBusStopListLoadingStatus,
    required this.searchedBusStopList,
    required this.getBusStopListLoadingStatus,
    required this.diplayedBusStopList,
    required this.selectBusStopModel,
  });

  HomeState.init()
      : searchBusStopListLoadingStatus = LoadingStatus.none,
        searchedBusStopList = <BusStopModel>[],
        getBusStopListLoadingStatus = LoadingStatus.none,
        diplayedBusStopList = <BusStopModel>[],
        selectBusStopModel = BusStopModel.init();

  HomeState copyWith({
    LoadingStatus? searchBusStopListLoadingStatus,
    List<BusStopModel>? searchedBusStopList,
    LoadingStatus? getBusStopListLoadingStatus,
    List<BusStopModel>? diplayedBusStopList,
    BusStopModel? selectBusStopModel,
  }) =>
      HomeState(
        searchBusStopListLoadingStatus: searchBusStopListLoadingStatus ??
            this.searchBusStopListLoadingStatus,
        searchedBusStopList: searchedBusStopList ?? this.searchedBusStopList,
        getBusStopListLoadingStatus:
            getBusStopListLoadingStatus ?? this.getBusStopListLoadingStatus,
        diplayedBusStopList: diplayedBusStopList ?? this.diplayedBusStopList,
        selectBusStopModel: selectBusStopModel ?? this.selectBusStopModel,
      );

  @override
  List<Object> get props => <Object>[
        searchBusStopListLoadingStatus,
        searchedBusStopList,
        getBusStopListLoadingStatus,
        diplayedBusStopList,
        selectBusStopModel
      ];
}
