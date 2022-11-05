import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/presentation/controllers/animated_signal_frequency_controller.dart';
import 'package:provider/provider.dart';

import 'presentation/controllers/animated_dynamic_island_controller.dart';

Widget injectProviders(final Widget app) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AnimatedDynamicIsland()),
      ChangeNotifierProvider(
          create: (context) => AnimatedFrequencyController()),
    ],
    child: app,
  );
}
