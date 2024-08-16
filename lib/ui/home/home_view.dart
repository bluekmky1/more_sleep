import 'dart:async';
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

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Timer? _debounce;
  final SearchController _searchController = SearchController();
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  late NaverMapController _mapController;

  bool onTaped = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: SearchAnchor(
                  searchController: _searchController,
                  viewBackgroundColor: colorTheme.background,
                  viewHintText: '정류장 검색',
                  builder:
                      (BuildContext context, SearchController controller) =>
                          Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              onTaped = true;
                            });
                          },
                          onTapUp: (_) {
                            setState(() {
                              onTaped = false;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              onTaped = false;
                            });
                          },
                          onTap: () {
                            controller.openView();
                          },
                          child: SizedBox(
                            height: 50,
                            child: AnimatedContainer(
                              duration: Durations.short2,
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                8,
                                16,
                                8,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                                color: onTaped
                                    ? colorTheme.surface200
                                    : colorTheme.backgroundElevated,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.directions_bus_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '정류장 검색',
                                    style: Typographies.bMedium16.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ]),
                        width: 58,
                        height: 50,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.alarm,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  viewOnChanged: (String value) {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                    }

                    _debounce = Timer(const Duration(milliseconds: 250), () {
                      if (_searchController.text.isNotEmpty) {
                        viewModel.getBusStop(keyword: value);
                      }
                    });
                  },
                  viewBuilder: (Iterable<Widget> suggestions) => Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final List<BusStopModel> options = ref.watch(
                        homeViewModelProvider.select(
                            (HomeState value) => value.searchedBusStopList),
                      );

                      if (_searchController.text.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('검색해주세용'),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                          title: Text(options[index].stopName),
                          onTap: () {
                            context.pop();
                          },
                        ),
                        itemCount: options.length,
                      );
                    },
                  ),
                  suggestionsBuilder: (_, __) => <Widget>[],
                ),
              ),
              Positioned(
                top: 65,
                right: 0,
                left: 0,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            overlayColor: colorTheme.surface300,
                            elevation: 2,
                            shadowColor: colorTheme.surface75,
                            backgroundColor: colorTheme.backgroundElevated),
                        onPressed: () {},
                        child: const Text('현 위치에서 재검색'),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                        ),
                      ]),
                  width: 50,
                  height: 50,
                  child: IconButton.filled(
                    onPressed: () async {
                      await _mapController
                          .updateCamera(NCameraUpdate.withParams(
                        bearing: 0,
                      ));
                    },
                    icon: const Icon(Icons.explore_outlined),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                        ),
                      ]),
                  width: 50,
                  height: 50,
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.gps_fixed_outlined),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 150,
                  child: DraggableScrollableSheet(
                    minChildSize: 0,
                    initialChildSize: 0,
                    snap: true,
                    controller: _draggableScrollableController,
                    builder: (BuildContext context,
                            ScrollController scrollController) =>
                        Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        color: colorTheme.background,
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              color: Theme.of(context).colorScheme.primary,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    '더포레스트힐',
                                    style: Typographies.hBold24.copyWith(
                                      color: colorTheme.background,
                                    ),
                                  )),
                                  CloseButton(
                                    color: colorTheme.background,
                                    onPressed: () async {
                                      await _draggableScrollableController
                                          .animateTo(
                                        0,
                                        duration: Durations.short4,
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    style: const ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: TextButton(
                                            onPressed: () {
                                              context
                                                  .goNamed(Routes.alarm.name);
                                            },
                                            child: const SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  '알림 생성하기',
                                                  style:
                                                      Typographies.tSemiBold18,
                                                ),
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
