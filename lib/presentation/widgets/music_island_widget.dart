import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/island_factory.dart';

import 'animated_opacity_widget.dart';

class MusicIslandWidget extends IslandFactory {
   MusicIslandWidget(
      {Key? key,
      super.expandable = true,
      required super.normalWidth,
      required super.normalHeight,
      required super.expandedWidth,
      required super.expandedHeight,
      required super.islandState})
      : super(key: key);

  @override
  Widget buildBody(BuildContext context, Size size) {
    final bool expanded = islandState == IslandState.expanded;
    double opacity = 0.0;

    if (islandState == IslandState.expanded ||
        islandState == IslandState.normal) {
      opacity = 1.0;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      // alignment: Alignment.center,

      /// expanded mode , else 0
      padding: EdgeInsets.all(expanded ? 16.0 : 0.0),

      /// expanded mode was created this column
      // child: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              /// expanded mode
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                AnimatedOpacityWidget(
                  opacity: opacity,

                  /// expanded mode -> true
                  isRight: expanded ? true : false,
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(
                      left: expanded ? 0.0 : 4.0,
                      top: expanded ? 0.0 : 5.0,
                    ),
                    duration: const Duration(milliseconds: 200),
                    height: expanded ? size.height * 0.3 : 24,
                    width: expanded ? size.height * 0.3 : 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 1.0),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: const FittedBox(
                      child: Icon(
                        Icons.adb_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                /// expanded mode
                if (expanded) _buildMusicInfo(),

                AnimatedContainer(
                  margin: EdgeInsets.only(left: 4.0, top: expanded ? 0.0 : 5.0),
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedOpacityWidget(
                    opacity: opacity,
                    isRight: false,
                    child: Padding(
                        padding: EdgeInsets.only(right: expanded ? 0.0 : 8.0),
                        child: const Icon(Icons.signal_cellular_alt_rounded,
                            color: Colors.yellow)),
                  ),
                ),
              ],
            ),
            if (expanded) _buildMiniPlayer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMusicInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: 14),
                  duration: Duration(seconds: 1),
                  child: Text('Pepas')),
              AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: 14),
                  duration: Duration(seconds: 1),
                  child: Text('Farruko')),
            ],
          ),
        ),
      );

  Widget _buildMiniPlayer() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10.0),
          _buildProgressBar(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.keyboard_double_arrow_left_outlined,
                  color: Colors.white, size: 45),
              Icon(Icons.pause, color: Colors.white, size: 45),
              Icon(Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.white, size: 45),
            ],
          ),
        ],
      );

  Widget _buildProgressBar() {
    const textGreyStyle = TextStyle(color: Colors.grey, fontSize: 10.0);
    return Row(
      children: [
        const AnimatedDefaultTextStyle(
            style: textGreyStyle,
            duration: Duration(seconds: 1),
            child: Text('2:10')),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 8.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
          ),
        ),
        const Text('-2:35', style: textGreyStyle),
      ],
    );
  }
}
