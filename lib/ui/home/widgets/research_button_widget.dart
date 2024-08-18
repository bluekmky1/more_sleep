import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/color_theme.dart';

class ResearchButtonWidget extends ConsumerWidget {
  const ResearchButtonWidget({
    required this.onpressed,
    super.key,
  });

  final AsyncCallback onpressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: onpressed,
              child: const Text('현 위치에서 재검색'),
            ),
          ],
        ),
      ),
    );
  }
}
