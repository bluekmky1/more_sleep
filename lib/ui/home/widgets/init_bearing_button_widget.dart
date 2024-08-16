import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InitBearingButtonWidget extends StatelessWidget {
  const InitBearingButtonWidget({
    required this.onpressed,
    super.key,
  });

  final AsyncCallback onpressed;

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 70,
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
            onPressed: onpressed,
            icon: const Icon(Icons.explore_outlined),
          ),
        ),
      );
}
