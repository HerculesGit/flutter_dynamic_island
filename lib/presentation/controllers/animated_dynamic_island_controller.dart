import 'package:flutter/foundation.dart';

class AnimatedDynamicIsland extends ChangeNotifier {
  double topContainerHeight = 0.0;
  double bottomContainerHeight = 0.0;
  double arrowPosition = -200.0;
  bool _startedAnimation = false;

  startAnimation() async {
    if (_startedAnimation) return;
    _startedAnimation = true;
    await _animateArrow();
    _animateBottom();
    _animateTop();
  }

  _animateArrow() async {
    await Future.delayed(const Duration(seconds: 0));
    arrowPosition = 200.0;
    notifyListeners();
  }

  _animateBottom() async {
    await Future.delayed(const Duration(milliseconds: 800));
    bottomContainerHeight = 195 + 100;
    notifyListeners();
  }

  _animateTop() async {
    await Future.delayed(const Duration(milliseconds: 1600));
    topContainerHeight = 195;
    notifyListeners();
  }

  restartAnimation() {
    _startedAnimation = false;
    topContainerHeight = 80.0;
    bottomContainerHeight = 20.0;
    arrowPosition = 0.0;
    notifyListeners();
  }
}
