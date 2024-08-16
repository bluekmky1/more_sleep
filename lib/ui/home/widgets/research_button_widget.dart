import 'package:flutter/material.dart';

import '../../../theme/color_theme.dart';

class ResearchButtonWidget extends StatelessWidget {
  const ResearchButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Theme.of(context).extension<ColorTheme>()!;
    return Positioned(
      top: 65,
      right: 0,
      left: 0,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  elevation: 2,
                  shadowColor: colorTheme.surface75,
                  backgroundColor: colorTheme.backgroundElevated),
              onPressed: () {},
              child: const Text('현 위치에서 재검색'),
            ),
          ],
        ),
      ),
    );
  }
}
