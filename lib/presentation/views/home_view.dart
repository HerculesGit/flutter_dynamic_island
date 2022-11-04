import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/widgets/charging_island_widget.dart';
import 'package:flutter_dynamic_island/presentation/widgets/music_island_widget.dart';
import 'package:provider/provider.dart';

import '../controllers/animated_dynamic_island_controller.dart';
import '../widgets/airpods_island_widget.dart';
import '../widgets/phone_island_widget.dart';
import '../widgets/silent_island_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<AnimatedDynamicIsland>(context, listen: false)
        .loadDynamicIsland([
      ChargingIslandWidget(),
      MusicIslandWidget(),
      SilentIslandWidget(),
      PhoneIslandWidget(),
      AirpodsIslandWidget(),
    ]);
    super.initState();
  }

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
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Wrap(
                runSpacing: 15,
                spacing: 130,
                children: [
                  ...controller.dynamicIsland
                      .map(
                        (island) => GestureDetector(
                          onTap: () => controller.didTapIsland(island),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.red,
                            child: Text('${island.name}'),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    controller.didTapBackButton();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                if (controller.displayExpandedButton)
                  GestureDetector(
                    onTap: () => controller.didTapExpandButton(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      color: Colors.blue,
                      child: Text('Expand'),
                    ),
                  )
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buildDynamicIslandScaffold(AnimatedDynamicIsland controller) {
    return controller.currentIsland.build(context);
  }
}
