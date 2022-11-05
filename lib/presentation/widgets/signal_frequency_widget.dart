import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/animated_signal_frequency_controller.dart';

class SignalFrequencyWidget extends StatelessWidget {
  final double maxHeight;
  final Color color;

  const SignalFrequencyWidget(
      {Key? key, required this.maxHeight, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimatedFrequencyController>(
        builder: (context, frequencyController, child) {
          frequencyController.startAnimation(maxHeight);

          return SizedBox(
            height: maxHeight,
            child: Row(
                children: frequencyController.sixPipes
                    .map((height) => AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: const EdgeInsets.only(left: 2),
                  color: color,
                  height: height,
                  width: 2.0,
                ))
                    .toList()),
          );
        });
  }
}
