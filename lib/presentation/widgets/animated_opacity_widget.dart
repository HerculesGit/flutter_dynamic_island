import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatelessWidget {
  final double opacity;
  final bool isRight;
  final Widget child;

  const AnimatedOpacityWidget(
      {Key? key,
      required this.opacity,
      required this.isRight,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 4.0;
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 100),
      child: Padding(
        padding: isRight
            ? const EdgeInsets.only(right: padding)
            : const EdgeInsets.only(left: padding),
        child: child,
      ),
    );
  }
}
