import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/routes.dart';
import '../../theme/color_palette.dart';
import '../../theme/typographies.dart';

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
          context.goNamed(Routes.addBus.name);
        },
      ),
      appBar: AppBar(
        title: const Text(
          '좀만 더 잘래',
          style: Typographies.tSemiBold20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 버스 노선을 표시하는 리스트
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: ColorPalette.lightGray100,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                height: 120,
                child: const Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 노선 이름
                        Text(
                          '7번 버스',
                          style: Typographies.tSemiBold16,
                        ),
                        Text(
                          'xxx정류장까지 3정거장 남음',
                          style: Typographies.bMedium14,
                        ),
                        Text(
                          '10분 후 도착 예상',
                          style: Typographies.bMedium14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
