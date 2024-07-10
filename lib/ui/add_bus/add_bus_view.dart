import 'package:flutter/material.dart';
import '../../theme/typographies.dart';

class AddBusView extends StatelessWidget {
  const AddBusView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('버스 노선 추가'),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('추가하기'),
              ],
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 버스 노선 검색
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('버스 노선을 선택해주세요.'),
                        SearchAnchor(
                          isFullScreen: false,
                          viewConstraints: const BoxConstraints(
                              minWidth: double.infinity, maxHeight: 300),
                          builder: (BuildContext context,
                                  SearchController controller) =>
                              TextButton(
                                  onPressed: () {
                                    controller.openView();
                                  },
                                  child: const Text('버스 검색하기')),
                          suggestionsBuilder: (BuildContext context,
                                  SearchController controller) =>
                              List<ListTile>.generate(
                            10,
                            (int index) => ListTile(
                              onTap: () {
                                controller.closeView('');
                                FocusScope.of(context).unfocus();
                              },
                              title: const Text('7번 버스'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 선택한 버스 노선
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: const Text(
                        '56번 버스',
                        style: Typographies.hBold16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('정류장을 선택해주세요.'),
                        SearchAnchor(
                          isFullScreen: false,
                          viewConstraints: const BoxConstraints(
                              minWidth: double.infinity, maxHeight: 300),
                          builder: (BuildContext context,
                                  SearchController controller) =>
                              TextButton(
                                  onPressed: () {
                                    controller.openView();
                                  },
                                  child: const Text('정류장 검색하기')),
                          suggestionsBuilder: (BuildContext context,
                                  SearchController controller) =>
                              List<ListTile>.generate(
                            10,
                            (int index) => ListTile(
                              onTap: () {
                                controller.closeView('');
                                FocusScope.of(context).unfocus();
                              },
                              title: const Text('7번 버스'),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 선택한 버스 정류장
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: const Text(
                        '더 포레스트 힐',
                        style: Typographies.hBold16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // 시간 설정
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('정류장까지 도착해야하는 시간을 설정해주세요.'),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onTapOutside: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: const InputDecoration(
                              labelText: '시간',
                              hintText: '00',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            onTapOutside: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: const InputDecoration(
                              labelText: '분',
                              hintText: '00',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // 알림 울릴 정류장 설정
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('몇정류장 전에 알림이 울리게 할 것인지 설정해주세요.'),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          child: DropdownButton<int>(
                            menuMaxHeight: 250,
                            isExpanded: true,
                            alignment: Alignment.topCenter,
                            value: 2,
                            items: List<DropdownMenuItem<int>>.generate(
                              10,
                              (int index) => DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text('${index + 1}'),
                              ),
                            ),
                            onChanged: (int? value) {},
                          ),
                        ),
                        const Text('정류장 전에'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
