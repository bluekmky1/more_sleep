import 'package:flutter/material.dart';

class CurrentPositionButtonWidget extends StatelessWidget {
  const CurrentPositionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 8,
        right: 8,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                ),
              ]),
          width: 50,
          height: 50,
          child: IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.gps_fixed_outlined),
          ),
        ),
      );
}
