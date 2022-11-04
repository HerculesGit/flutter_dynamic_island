import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/island_factory.dart';

import 'animated_opacity_widget.dart';
import 'dart:math' as math;

class PhoneIslandWidget extends IslandFactory {
  PhoneIslandWidget({
    Key? key,
    super.expandable = true,
    super.name = 'Phone',
    super.normalWidth = 0.6,
    super.normalHeight = 0.2,
    super.expandedWidth = 0.90,
    super.expandedHeight = 0.12,
  }) : super(key: key);

  @override
  double borderRadius() => 100.0;

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
              isRight: true,
              child: Container(
                margin: const EdgeInsets.only(left: 0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: controller.islandState == IslandState.expanded
                    ? _buildPersonIcon(size)
                    : Row(
                        children: const [
                          Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          SizedBox(width: 2.0),
                          Text('0:25', style: TextStyle(color: Colors.green))
                        ],
                      ),
              ),
            ),
            AnimatedOpacityWidget(
              opacity: opacity,
              isRight: true,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: controller.islandState == IslandState.expanded
                    ? _buildCallButtons(size)
                    : const Text('IiIIIIi',
                        style: const TextStyle(color: Colors.green)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonIcon(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        children: [
          Container(
            height: size.height * 0.7,
            width: size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: AnimatedDefaultTextStyle(
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    duration: Duration(seconds: 1),
                    child: Text('mobile')),
              ),
              Flexible(
                child: AnimatedDefaultTextStyle(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    duration: Duration(seconds: 1),
                    child: Text('Herco Dev')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCallButtons(Size size) {
    final double height = size.height;
    return Row(
      children: [
        Transform.rotate(
          angle: -math.pi / 0.31,
          child: _callButton(
            icon: Icons.local_phone_sharp,
            color: Colors.red,
            height: height,
          ),
        ),
        const SizedBox(width: 12),
        _callButton(
          icon: Icons.phone,
          color: Colors.green,
          height: height,
        ),
      ],
    );
  }

  Widget _callButton(
          {required IconData icon,
          required Color color,
          required double height}) =>
      Container(
          height: height * 0.5,
          width: height * 0.5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon, color: Colors.white));
}
