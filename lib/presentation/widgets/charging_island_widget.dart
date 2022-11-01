import 'package:flutter/material.dart';

import 'animated_opacity_widget.dart';

class ChargingIslandWidget extends StatelessWidget {
  final double opacity;

  const ChargingIslandWidget({Key? key, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: false,
          child: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Charging', style: TextStyle(color: Colors.white)),
          ),
        ),
        const Spacer(),
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: true,
          child: Row(
            children: [
              Text(
                '75%',
                style: TextStyle(
                  color: Colors.green.shade200,
                ),
              ),
              const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.battery_5_bar_outlined,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
