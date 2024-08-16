import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import '../../routes/routes.dart';
import '../../theme/color_theme.dart';
import '../../theme/typographies.dart';
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
  late NaverMapController _mapController;

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

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
          size: const Size.square(32),
          anchor: const NPoint(0.5, 0.9),
        )..setOnTapListener((NMarker nMarker) async {
            await _draggableScrollableController.animateTo(
              1,
              duration: Durations.short4,
              curve: Curves.easeInOut,
            );
          });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              NaverMap(
                onMapReady: (NaverMapController controller) {
                  _mapController = controller;
                  _mapController.addOverlay(
                    busStopMarker(
                      busStopModel: BusStopModel(
                        stopId: 'asd',
                        stopName: '더포레스트힐',
                        cityCode: 12,
                        cityName: '경기도 안양시',
                        lat: 37.5664056,
                        long: 126.9778222,
                      ),
                    ),
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
              const ResearchButtonWidget(),

              // 회전 초기화 버튼
              InitBearingButtonWidget(
                onpressed: () async {
                  await _mapController.updateCamera(
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
