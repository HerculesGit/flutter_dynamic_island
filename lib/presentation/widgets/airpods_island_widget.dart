import 'package:flutter/material.dart';

import 'animated_opacity_widget.dart';

class AirpodsIslandWidget extends StatelessWidget {
  final double opacity;

  const AirpodsIslandWidget({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: false,
          child: const Icon(Icons.headphones_rounded, color: Colors.white),
        ),
        const Spacer(),
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: true,
          child: const Icon(Icons.circle_outlined, color: Colors.green),
        ),
      ],
    );
  }
}
