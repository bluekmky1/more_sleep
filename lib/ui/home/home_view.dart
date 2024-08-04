import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/loading_status.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import '../../theme/color_palette.dart';
import '../../theme/color_theme.dart';
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
  bool onTaped = false;
  final GlobalKey<State<StatefulWidget>> _sheet = GlobalKey();
  final DraggableScrollableController _dragController =
      DraggableScrollableController();

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              const NaverMap(),
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
                              child: const Row(
                                children: <Widget>[
                                  Icon(Icons.directions_bus_outlined),
                                  SizedBox(width: 12),
                                  Text('정류장 검색'),
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
                        homeViewModelProvider
                            .select((HomeState value) => value.busStopList),
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
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          overlayColor: colorTheme.surface300,
                          elevation: 2,
                          shadowColor: colorTheme.surface75,
                          backgroundColor: colorTheme.backgroundElevated),
                      onPressed: () async {
                        await _dragController.animateTo(0.6,
                            duration: Durations.short2,
                            curve: Curves.easeInOut);
                      },
                      child: const Text('버스 마커 클릭'),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                  key: _sheet,
                  snap: true,
                  minChildSize: 0,
                  initialChildSize: 0,
                  maxChildSize: 0.45,
                  controller: _dragController,
                  builder: (BuildContext context,
                          ScrollController scrollController) =>
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: colorTheme.background,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            )),
                        child: CustomScrollView(
                          controller: scrollController,
                          slivers: <Widget>[
                            const SliverAppBar(
                              pinned: true,
                              floating: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              collapsedHeight: 55,
                              toolbarHeight: 50,
                              stretch: true,
                              title: Text('더 포레스트 힐'),
                              bottom: PreferredSize(
                                preferredSize: Size.fromHeight(40),
                                child: Text('data'),
                              ),
                            ),
                            const SliverToBoxAdapter(),
                            SliverList.builder(
                                itemCount: 10,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Material(
                                          child: ListTile(
                                            tileColor: colorTheme.background,
                                            onTap: () {},
                                            title: Text('11-$index'),
                                          ),
                                        )),
                          ],
                        ),
                      ))
            ],
          ),
        ));
  }
}
