import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/typographies.dart';
import '../home_state.dart';
import '../home_view_model.dart';

class CreateAlarmBottomSheetWidget extends ConsumerWidget {
  const CreateAlarmBottomSheetWidget({
    required DraggableScrollableController draggableScrollableController,
    super.key,
  }) : _draggableScrollableController = draggableScrollableController;

  final DraggableScrollableController _draggableScrollableController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 150,
        child: DraggableScrollableSheet(
          minChildSize: 0,
          initialChildSize: 0,
          snap: true,
          controller: _draggableScrollableController,
          builder: (BuildContext context, ScrollController scrollController) =>
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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            state.selectBusStopModel.stopName,
                            maxLines: 1,
                            style: Typographies.hBold20.copyWith(
                              color: colorTheme.background,
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        CloseButton(
                          color: colorTheme.background,
                          onPressed: () async {
                            await _draggableScrollableController.animateTo(
                              0,
                              duration: Durations.short4,
                              curve: Curves.easeInOut,
                            );
                          },
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.goNamed(Routes.alarm.name);
                              },
                              child: const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    '이 정류장에 알림 생성하기',
                                    style: Typographies.tSemiBold16,
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}
