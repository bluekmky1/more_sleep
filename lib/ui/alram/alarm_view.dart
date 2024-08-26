import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/bus_stop/model/bus_stop_model.dart';
import '../../theme/color_theme.dart';
import '../../theme/typographies.dart';
import 'alarm_state.dart';
import 'alarm_view_model.dart';

class AlarmView extends ConsumerStatefulWidget {
  const AlarmView({
    required this.busStopId,
    super.key,
  });

  final String busStopId;

  @override
  ConsumerState<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends ConsumerState<AlarmView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(alarmViewModelProvider.notifier)
          .getBusStopModel(stopId: widget.busStopId);

      final BusStopModel busStopModel =
          ref.read(alarmViewModelProvider).busStopModel;

      await ref.read(alarmViewModelProvider.notifier).getTransitBusByBusStopId(
            stopId: busStopModel.stopId,
            cityCode: busStopModel.cityCode.toString(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final AlarmState state = ref.watch(alarmViewModelProvider);
    final AlarmViewModel viewModel = ref.read(alarmViewModelProvider.notifier);

    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme.background,
        centerTitle: true,
        title: const Text('알림 생성'),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  context.pop();
                },
                child: const Text('취소'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text('저장'),
              ),
            )
          ],
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                // 버스 + 정류장 이름
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorTheme.surface75,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(16),
                          height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text('정류장'),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    state.busStopModel.stopName,
                                    style: Typographies.hBold24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorTheme.surface75,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text('감지 하고 싶은 버스 노선'),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    ListTile(
                                        onTap: () {
                                          viewModel.selectBus(
                                              bus: state.transitBusList[index]);
                                        },
                                        title: Text(state
                                            .transitBusList[index].busNumber),
                                        leading: Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onChanged: (bool? value) {
                                            viewModel.selectBus(
                                                bus: state
                                                    .transitBusList[index]);
                                          },
                                          value: state.selectedBusList.contains(
                                              state.transitBusList[index]),
                                        )),
                                itemCount: state.transitBusList.length,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 시간
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorTheme.surface75,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text('버스 감지를 시작할 시간을 정해주세요'),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: SizedBox(
                                  height: 80,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: TextField(
                                        maxLength: 2,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^(1[0-2]|[1-9])$'))
                                        ],
                                        style:
                                            Typographies.tSemiBold20.copyWith(
                                          fontSize: 32,
                                        ),
                                        onTapOutside: (_) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '시',
                                          counterText: '',
                                        ),
                                      )),
                                      SizedBox(
                                        width: 32,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: colorTheme.txtPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: colorTheme.txtPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: TextField(
                                        keyboardType: TextInputType.number,
                                        maxLength: 2,
                                        textAlign: TextAlign.center,
                                        style: Typographies.tSemiBold20
                                            .copyWith(fontSize: 32),
                                        onTapOutside: (_) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^([0-5]?[0-9])$'))
                                        ],
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '분',
                                          counterText: '',
                                        ),
                                      )),
                                      const SizedBox(width: 16),
                                      Column(
                                        children: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              backgroundColor: state.isAm
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : colorTheme.surface75,
                                            ),
                                            onPressed: () {
                                              viewModel.selectAmPm(
                                                amPm: 'am',
                                              );
                                            },
                                            child: Text(
                                              '오전',
                                              style: TextStyle(
                                                color: !state.isAm
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : colorTheme.background,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              backgroundColor: !state.isAm
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : colorTheme.surface75,
                                            ),
                                            onPressed: () {
                                              viewModel.selectAmPm(
                                                amPm: 'pm',
                                              );
                                            },
                                            child: Text(
                                              '오후',
                                              style: TextStyle(
                                                color: state.isAm
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : colorTheme.background,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: colorTheme.surface75,
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    height: 165 + 47,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('알림 종류'),
                        ),
                        Expanded(
                            child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                viewModel.selectAlarmType(alarmType: '알람');
                              },
                              leading: Checkbox(
                                value: state.selectedAlarmType == '알람',
                                onChanged: (bool? value) {
                                  viewModel.selectAlarmType(alarmType: '알람');
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              title: const Text('알람'),
                            ),
                            ListTile(
                              onTap: () {
                                viewModel.selectAlarmType(alarmType: '푸쉬 알림');
                              },
                              leading: Checkbox(
                                value: state.selectedAlarmType == '푸쉬 알림',
                                onChanged: (bool? value) {
                                  viewModel.selectAlarmType(alarmType: '푸쉬 알림');
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              title: const Text('푸쉬 알림'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('AlarmManager'),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
