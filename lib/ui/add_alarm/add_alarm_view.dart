import 'package:flutter/material.dart';
import '../../theme/color_palette.dart';
import '../../theme/typographies.dart';

class AddAlarmView extends StatelessWidget {
  const AddAlarmView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text(
            '알림 추가',
            style: Typographies.hBold20,
          ),
        ),
        body: Column(
          children: <Widget>[
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      _SearchBus(),
                      _SearchBusStop(),
                      _AlarmType(),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: ColorPalette.darkBlue300,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '추가하기',
                    style: Typographies.bMedium16.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _AlarmType extends StatelessWidget {
  const _AlarmType({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: <Widget>[
              Text(
                '알림 형태',
                style: Typographies.hBold18,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio<String>(
                value: '푸쉬알림',
                groupValue: '푸쉬알림',
                onChanged: (String? value) {},
              ),
              const Text('푸쉬알림')
            ],
          )
        ],
      );
}

class _SearchBus extends StatelessWidget {
  const _SearchBus();

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('버스 노선', style: Typographies.hBold18),
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) =>
                    TextButton(
                  onPressed: () {
                    controller.openView();
                  },
                  child: const Text('검색'),
                ),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) =>
                        <Widget>[
                  const Text('data'),
                ],
              ),
            ],
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorPalette.lightGray75,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: <Widget>[
                Text('100번 버스'),
              ],
            ),
          ),
        ],
      );
}

class _SearchBusStop extends StatelessWidget {
  const _SearchBusStop();

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('알림이 울릴 정류장', style: Typographies.hBold18),
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) =>
                    TextButton(
                  onPressed: () {
                    controller.openView();
                  },
                  child: const Text('검색'),
                ),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) =>
                        <Widget>[
                  const Text('data'),
                ],
              ),
            ],
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorPalette.lightGray75,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: <Widget>[
                Text('더 포레스트 힐'),
              ],
            ),
          ),
        ],
      );
}
