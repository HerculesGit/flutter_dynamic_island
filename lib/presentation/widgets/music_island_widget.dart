import 'package:flutter/material.dart';

import 'animated_opacity_widget.dart';

class MusicIslandWidget extends StatelessWidget {
  final double opacity;
  final bool expanded;

  const MusicIslandWidget(
      {Key? key, required this.opacity, required this.expanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: false,
          child: Container(
            margin: const EdgeInsets.only(left: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(5.0)),
            child: const Icon(
              Icons.adb_rounded,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: true,
          child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.signal_cellular_alt_rounded,
                  color: Colors.yellow)),
        ),
      ],
    );
  }
}
