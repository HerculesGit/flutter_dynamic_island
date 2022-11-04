import 'package:flutter/material.dart';

/// default, normal, expanded
enum IslandState { none, normal, expanded }

class IslandController {
  IslandState islandState = IslandState.none;

  void changeState(IslandState newState) => islandState = newState;
}

abstract class IslandFactory extends StatelessWidget {
  final String name;
  final double normalWidth;
  final double normalHeight;
  final double expandedWidth;
  final double expandedHeight;
  final bool expandable;

  final IslandController controller = IslandController();

  IslandFactory({
    Key? key,
    required this.name,
    required this.normalWidth,
    required this.expandedWidth,
    required this.normalHeight,
    required this.expandedHeight,
    this.expandable = false,
  }) : super(key: key);

  Widget buildBody(final Size size, final double opacity);

  changeState(IslandState newState) {
    controller.changeState(newState);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.3;
    double height = 35.0;

    final islandState = controller.islandState;

    if (islandState == IslandState.normal) {
      width = MediaQuery.of(context).size.width * normalWidth;
      // height = MediaQuery.of(context).size.height * normalHeight;
    } else if (islandState == IslandState.expanded && expandable) {
      width = MediaQuery.of(context).size.width * expandedWidth;
      height = MediaQuery.of(context).size.height * expandedHeight;
    }

    return AnimatedContainer(
      curve: Curves.easeOutBack,
      width: width,
      height: height,
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius()),
      ),
      child: islandState != IslandState.none
          ? buildBody(
              Size(width, height), islandState == IslandState.none ? 0.0 : 1.0)
          : Container(),
    );
  }

  double borderRadius() => 25.0;
}
