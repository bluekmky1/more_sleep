import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme/typographies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => Scaffold(
          persistentFooterButtons: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    foregroundColor: Colors.black,
                    textStyle: Typographies.tSemiBold20),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('저장하기'),
                  ],
                ))
          ],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
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
                  const SizedBox(height: 8),
                  SearchAnchor(
                      isFullScreen: false,
                      viewShape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      viewSide: const BorderSide(color: Colors.black12),
                      dividerColor: Colors.black12,
                      viewElevation: 0,
                      viewConstraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 3),
                      builder:
                          (BuildContext context, SearchController controller) =>
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber,
                                ),
                                height: 120,
                                child: const Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '추적하고자 하는 노선',
                                            style: Typographies.bRegular16,
                                          ),
                                          Spacer(),
                                          Text(
                                            '11-2번',
                                            style: Typographies.hBold24,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        size: 48,
                                        Icons.route_rounded,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) =>
                              <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('11-2'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('11-2'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('11-2'),
                                ),
                              ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
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
                                '알림이 울리면 좋을 것 같은 시간',
                                style: Typographies.bRegular16,
                              ),
                              Spacer(),
                              Text(
                                'AM 11:30',
                                style: Typographies.hBold24,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            size: 48,
                            Icons.alarm_rounded,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
}
