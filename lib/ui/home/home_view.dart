import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('좀만 더 잘게'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 버스 노선을 표시하는 리스트
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text('버스 노선 $index'),
                  onTap: () {
                    // 노선을 클릭하면 해당 노선의 상세 페이지로 이동
                  },
                ),
              ),
            )
          ],
        ));
  }
}
