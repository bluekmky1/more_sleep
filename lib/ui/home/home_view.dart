import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../routes/routes.dart';
import '../../theme/color_palette.dart';
import '../../theme/typographies.dart';
import 'home_state.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.goNamed(Routes.addAlarm.name);
        },
      ),
      appBar: AppBar(
        title: const Text(
          '좀만 더 잘래',
          style: Typographies.hBold24,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12),
            _BusAlarmListItem(),
          ],
        ),
      ));
}

class _BusAlarmListItem extends ConsumerWidget {
  const _BusAlarmListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Container(
      height: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorPalette.lightGray75,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(state.getExpectedBusArrivalInfoloadingStatus.toString()),
                const Text(
                  '7번 버스',
                  style: Typographies.hBold20,
                ),
                const Text(
                  '더 포레스트힐에 근접하면 알림이 울립니다.',
                  maxLines: 2,
                  style: Typographies.tSemiBold16,
                ),
                const Spacer(),
                const Text(
                  '알림 형태 : 푸시 알림',
                  style: Typographies.bMedium14,
                ),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (bool value) {
              viewModel.getExpectedBusArrivalInfo();
            },
          )
        ],
      ),
    );
  }
}
