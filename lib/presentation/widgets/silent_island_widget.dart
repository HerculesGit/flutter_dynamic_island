import 'package:flutter/material.dart';

import 'animated_opacity_widget.dart';

class SilentIslandWidget extends StatelessWidget {
  final double opacity;

  const SilentIslandWidget({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const redColor = Colors.red;

    return Row(
      children: [
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: false,
          child: Container(
            margin: const EdgeInsets.only(left: 2.0),
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            decoration: BoxDecoration(
                color: redColor, borderRadius: BorderRadius.circular(25.0)),
            child: const Icon(
              Icons.notifications_off_rounded,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: true,
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('Silent', style: TextStyle(color: redColor)),
          ),
        ),
      ],
    );
  }
}
