import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading_status.dart';
import '../../../domain/bus_stop/model/bus_stop_model.dart';
import '../../../theme/typographies.dart';
import '../home_state.dart';
import '../home_view_model.dart';

class BusStopWidget extends ConsumerStatefulWidget {
  const BusStopWidget({
    super.key,
  });

  @override
  ConsumerState<BusStopWidget> createState() => _BusStopWidgetState();
}

class _BusStopWidgetState extends ConsumerState<BusStopWidget> {
  Timer? _debounce;

  late Iterable<Widget> _lastOptions = <Widget>[];

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeViewModelProvider);

    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

    return SearchAnchor(
      isFullScreen: false,
      viewConstraints: const BoxConstraints(maxHeight: 300),
      builder: (BuildContext context, SearchController controller) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.amber,
        ),
        height: 125,
        child: const Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '알림이 울리게 할 정류장',
                    style: Typographies.bRegular16,
                  ),
                  Spacer(),
                  Text(
                    '삼성래미안아파트',
                    style: Typographies.hBold24,
                    maxLines: 2,
                  ),
                  Text(
                    '10007',
                    style: Typographies.bMedium14,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                size: 48,
                Icons.room_rounded,
              ),
            )
          ],
        ),
      ),
      viewOnChanged: (String value) {},
      suggestionsBuilder:
          (BuildContext context, SearchController controller) async {
        if (controller.text.isEmpty) {
          return <Widget>[];
        }
        // if (_debounce?.isActive ?? false) {
        //   _debounce?.cancel();
        // }
        // _debounce = Timer(const Duration(milliseconds: 250), () async {});
        await viewModel.getBusStop(keyword: controller.text);

        final List<BusStopModel> options =
            ref.read(homeViewModelProvider).busStopList;

        return _lastOptions =
            List<ListTile>.generate(options.length, (int index) {
          final String item = options[index].stopName;
          return ListTile(
            title: Text(item),
          );
        });
      },
      viewBuilder: (Iterable<Widget> suggestions) => SingleChildScrollView(
        child: Column(children: suggestions.toList()),
      ),
    );
  }
}
