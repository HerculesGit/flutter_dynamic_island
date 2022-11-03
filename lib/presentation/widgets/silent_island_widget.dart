import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/island_factory.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/no_expanded_island.dart';

import 'animated_opacity_widget.dart';

class SilentIslandWidget extends NoExpandedIsland {
  SilentIslandWidget(
      {Key? key,
      super.name = 'Silent',
      super.normalWidth = 0.6,
      super.normalHeight = 0.2})
      : super(key: key);

  @override
  Widget buildBody(BuildContext context, Size size) {
    final double opacity =
        controller.islandState == IslandState.none ? 0.0 : 1.0;
    return Row(
      children: [
        AnimatedOpacityWidget(
          opacity: opacity,
          isRight: false,
          child: Container(
            margin: const EdgeInsets.only(left: 2.0),
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25.0)),
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
            child: Text('Silent', style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
