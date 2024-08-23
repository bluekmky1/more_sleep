import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import '../common/const/assets.dart';
import 'home_state.dart';
import 'home_view_model.dart';
import 'widgets/bus_stop_search_bar_widget.dart';
import 'widgets/create_alarm_bottom_sheet_widget.dart';
import 'widgets/current_position_buttton_widget.dart';
import 'widgets/init_bearing_button_widget.dart';
import 'widgets/open_alarm_list_button_widget.dart';
import 'widgets/research_button_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  NaverMapController? mapController;

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    if (mapController != null) {
      mapController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

    ref.listen(
      homeViewModelProvider
          .select((HomeState value) => value.selectBusStopModel),
      (BusStopModel? prev, BusStopModel next) async {
        // 이전에 선택했던 정류장일 경우
        // 이전에 선택했던 정류장이 아닐 경우
        if (prev != next) {
          await mapController!.updateCamera(
            NCameraUpdate.scrollAndZoomTo(
              target: NLatLng(
                next.lat,
                next.long,
              ),
            ),
          );

          // 현재 지도에 표시되고 있는 정류장일 경우 마커 업데이트 미실시
          if (state.diplayedBusStopList.contains(next)) {
            await _draggableScrollableController.animateTo(
              1,
              duration: Durations.short4,
              curve: Curves.easeInOut,
            );
            return;
          }
          viewModel.clearDiplayedBusStop();

          await mapController!.clearOverlays(
            type: NOverlayType.marker,
          );

          final NLatLngBounds bounds = await mapController!.getContentBounds();

          await viewModel.getBusStopByBounds(
            startLat: bounds.southWest.latitude,
            startLong: bounds.southWest.longitude,
            endLat: bounds.northEast.latitude,
            endLong: bounds.northEast.longitude,
          );

          final List<BusStopModel> newBusStopList =
              ref.read(homeViewModelProvider).diplayedBusStopList;

          await mapController!.addOverlayAll(
            List<NMarker>.generate(
              newBusStopList.length,
              (int index) => NMarker(
                id: newBusStopList[index].stopId,
                position: NLatLng(
                  newBusStopList[index].lat,
                  newBusStopList[index].long,
                ),
                icon: const NOverlayImage.fromAssetImage(Assets.marker),
                size: const Size.square(16),
                anchor: const NPoint(0.5, 0.9),
              )..setOnTapListener(
                  (NMarker nMarker) {
                    viewModel.selectBusStop(
                      busStopModel: newBusStopList[index],
                    );
                  },
                ),
            ).toSet(),
          );

          await _draggableScrollableController.animateTo(
            1,
            duration: Durations.short4,
            curve: Curves.easeInOut,
          );
        }
      },
    );

    NMarker busStopMarker({
      required BusStopModel busStopModel,
    }) =>
        NMarker(
          id: busStopModel.stopId,
          position: NLatLng(
            busStopModel.lat,
            busStopModel.long,
          ),
          icon: const NOverlayImage.fromAssetImage(Assets.marker),
          size: const Size.square(16),
          anchor: const NPoint(0.5, 0.9),
        )..setOnTapListener(
            (NMarker nMarker) async {
              viewModel.selectBusStop(busStopModel: busStopModel);
              await _draggableScrollableController.animateTo(
                1,
                duration: Durations.short4,
                curve: Curves.easeInOut,
              );
            },
          );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              NaverMap(
                options: const NaverMapViewOptions(
                  minZoom: 8,
                ),
                onMapReady: (NaverMapController controller) async {
                  mapController = controller;
                  final NLatLngBounds bounds =
                      await mapController!.getContentBounds();

                  await viewModel.getBusStopByBounds(
                    startLat: bounds.southWest.latitude,
                    startLong: bounds.southWest.longitude,
                    endLat: bounds.northEast.latitude,
                    endLong: bounds.northEast.longitude,
                  );

                  final List<BusStopModel> newBusStopList =
                      ref.read(homeViewModelProvider).diplayedBusStopList;

                  await mapController!.addOverlayAll(
                    List<NMarker>.generate(
                      newBusStopList.length,
                      (int index) => busStopMarker(
                        busStopModel: newBusStopList[index],
                      ),
                    ).toSet(),
                  );
                },
              ),
              // 검색 바 + 알림 리스트 버튼
              const Row(
                children: <Widget>[
                  Expanded(
                    child: BusStopSearchBarWidget(),
                  ),
                  OpenAlarmListButtonWidget(),
                ],
              ),

              // 현 위치에서 재검색 버튼
              ResearchButtonWidget(
                onpressed: () async {
                  if (mapController == null) {
                    return;
                  }
                  viewModel.clearDiplayedBusStop();

                  await mapController!.clearOverlays(
                    type: NOverlayType.marker,
                  );

                  final NLatLngBounds bounds =
                      await mapController!.getContentBounds();

                  await viewModel.getBusStopByBounds(
                    startLat: bounds.southWest.latitude,
                    startLong: bounds.southWest.longitude,
                    endLat: bounds.northEast.latitude,
                    endLong: bounds.northEast.longitude,
                  );

                  final List<BusStopModel> newBusStopList =
                      ref.read(homeViewModelProvider).diplayedBusStopList;

                  await mapController!.addOverlayAll(
                    List<NMarker>.generate(
                      newBusStopList.length,
                      (int index) => busStopMarker(
                        busStopModel: newBusStopList[index],
                      ),
                    ).toSet(),
                  );
                },
              ),

              // 회전 초기화 버튼
              InitBearingButtonWidget(
                onpressed: () async {
                  if (mapController == null) {
                    return;
                  }

                  await mapController!.updateCamera(
                    NCameraUpdate.withParams(
                      bearing: 0,
                    ),
                  );
                },
              ),

              // 현재 내위치로 오기 버튼
              const CurrentPositionButtonWidget(),

              // 알림 생성 바텀 시트
              CreateAlarmBottomSheetWidget(
                draggableScrollableController: _draggableScrollableController,
              ),
            ],
          ),
        ));
  }
}
