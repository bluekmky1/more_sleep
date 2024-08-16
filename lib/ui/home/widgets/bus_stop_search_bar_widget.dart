import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/bus_stop/model/bus_stop_model.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/typographies.dart';
import '../home_state.dart';
import '../home_view_model.dart';

class BusStopSearchBarWidget extends ConsumerStatefulWidget {
  const BusStopSearchBarWidget({
    super.key,
  });

  @override
  ConsumerState<BusStopSearchBarWidget> createState() =>
      _BusStopSearchBarWidgetState();
}

class _BusStopSearchBarWidgetState
    extends ConsumerState<BusStopSearchBarWidget> {
  final SearchController _searchController = SearchController();

  Timer? _debounce;

  bool onTaped = false;

  @override
  void dispose() {
    _debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;

    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: SearchAnchor(
        searchController: _searchController,
        viewBackgroundColor: colorTheme.background,
        viewHintText: '정류장 검색',
        builder: (BuildContext context, SearchController controller) =>
            GestureDetector(
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '정류장 검색',
                    style: Typographies.bMedium16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  .select((HomeState value) => value.searchedBusStopList),
            );

            if (_searchController.text.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('검색해주세용'),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) => ListTile(
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
    );
  }
}
