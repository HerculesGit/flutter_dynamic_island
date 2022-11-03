import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/island_factory.dart';

abstract class NoExpandedIsland extends IslandFactory {
   NoExpandedIsland(
      {Key? key,
      super.expandable = false,
      super.expandedWidth = 0.0,
      super.expandedHeight = 0.0,
      required super.normalWidth,
      required super.normalHeight,
      required super.islandState})
      : super(key: key);
}
