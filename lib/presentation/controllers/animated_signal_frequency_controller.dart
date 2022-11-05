import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedFrequencyController extends ChangeNotifier {
  late Timer timer;
  bool isAnimation = false;

  List<double> sixPipes = [];
  List<double> sixFixedPipes = [];

  startAnimation(final double maxHeight) async {
    if (isAnimation) return;

    sixFixedPipes = generateSixPipes(maxHeight);
    isAnimation = true;

    timer = Timer.periodic(const Duration(milliseconds: 120), (_) {
      sixPipes = generateSixPipes(maxHeight);
      notifyListeners();
      print(sixPipes);
    });
  }

  List<double> generateSixPipes(final double maxHeight) {
    final minPercentageOfTheHeight = ((maxHeight) * 0.3).toInt();
    return List.generate(
        5, (index) => nextDouble(minPercentageOfTheHeight, maxHeight.toInt()));
  }

  double nextDouble(int min, int max) =>
      (min + Random().nextInt((max + 1) - min)).toDouble();

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
