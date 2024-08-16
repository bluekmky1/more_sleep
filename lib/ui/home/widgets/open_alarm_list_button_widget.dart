import 'package:flutter/material.dart';

class OpenAlarmListButtonWidget extends StatelessWidget {
  const OpenAlarmListButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ]),
        width: 50,
        height: 50,
        child: IconButton.filled(
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8),
            ),
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.alarm,
            color: Colors.white,
          ),
        ),
      );
}
