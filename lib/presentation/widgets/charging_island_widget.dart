import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/no_expanded_island.dart';

import 'animated_opacity_widget.dart';

class ChargingIslandWidget extends NoExpandedIsland {
  ChargingIslandWidget(
      {Key? key,
      super.name = 'Charging',
      super.normalWidth = 0.7,
      super.normalHeight = 0.2})
      : super(key: key);

  @override
  Widget buildBody(final Size size, final double opacity) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox.fromSize(
        size: size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedOpacityWidget(
              opacity: opacity,
              isRight: false,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Charging', style: TextStyle(color: Colors.white)),
              ),
            ),
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
        ),
      ),
    );
  }
}
