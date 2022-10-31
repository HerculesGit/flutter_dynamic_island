import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/animated_dynamic_island_controller.dart';
import '../widgets/music_island_widget.dart';
import '../widgets/silent_island_widget.dart';

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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      // curve: Curves.easeInOutQuart,
      width: controller.isDefaultIcon ? width * 0.3 : width * 0.97,
      height: controller.expandedIsland ? height * 0.22 : 35,
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MusicIslandWidget(
        opacity: controller.opacity,
        width: width * 0.97,
        height: height * 0.22,
        expanded: controller.expandedIsland,
      ),
    );
  }
}
