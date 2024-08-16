import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/color_theme.dart';
import '../../theme/typographies.dart';

class AlarmView extends ConsumerStatefulWidget {
  const AlarmView({super.key});

  @override
  ConsumerState<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends ConsumerState<AlarmView> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('정류장'),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '더포레스트힐',
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
                          padding: const EdgeInsets.all(16),
                          height: 160,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('노선'),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '7',
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
                                              ),
                                              onPressed: () {},
                                              child: const Text('오전')),
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              onPressed: () {},
                                              child: const Text('오후'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
