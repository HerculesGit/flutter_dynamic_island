import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/controllers/animated_dynamic_insland_controller.dart';

Widget buildProviders(final Widget app) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => AnimatedDynamicIsland()),
    ],
    child: app,
  );
}
