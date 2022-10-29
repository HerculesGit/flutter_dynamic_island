import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/animated_dynamic_insland_controller.dart';

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
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDynamicIslandScaffold(),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildDynamicIslandScaffold() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(width: width / 3.5, height: 30),
    );
  }
}
