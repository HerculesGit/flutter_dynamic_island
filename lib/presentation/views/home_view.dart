import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/factory/island_factory.dart';
import 'package:flutter_dynamic_island/presentation/widgets/music_island_widget.dart';
import 'package:provider/provider.dart';

import '../controllers/animated_dynamic_island_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) =>
      SafeArea(child: Scaffold(body: _buildBody()));

  Widget _buildBody() {
    return Consumer<AnimatedDynamicIsland>(
        builder: (context, controller, child) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDynamicIslandScaffold(controller),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => controller.changeButton(),
                  child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('change island')),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => controller.expandButton(),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: const Text('Expaded')),
                ),
                const SizedBox(height: 32),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildDynamicIslandScaffold(AnimatedDynamicIsland controller) {
    return const MusicIslandWidget(
        // width
        normalWidth: 0.5,
        expandedWidth: 0.97,

        // height
        normalHeight: 0.2,
        expandedHeight: 0.2,
        opacity: 1.0,
        islandState: IslandState.none);
  }
}
