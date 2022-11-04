import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/no_expanded_island.dart';

import 'animated_opacity_widget.dart';

class AirpodsIslandWidget extends NoExpandedIsland {
  AirpodsIslandWidget(
      {Key? key,
      super.name = 'Airpods',
      super.normalWidth = 0.5,
      super.normalHeight = 0.2})
      : super(key: key);

  @override
  Widget buildBody(final Size size, final double opacity) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 0.5),
          child: AnimatedOpacityWidget(
            opacity: opacity,
            isRight: false,
            child: const Icon(Icons.headphones_rounded, color: Colors.white),
          ),
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
