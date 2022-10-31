import 'package:flutter/foundation.dart';

class AnimatedDynamicIsland extends ChangeNotifier {
  bool isDefaultIcon = false;
  double opacity = 0.0;

  bool expandedIsland = false;

  changeButton() async {
    isDefaultIcon = !isDefaultIcon;

    if (isDefaultIcon) {
      hideIcons();
    } else {
      showIcons();
    }
  }

  expandButton() {
    expandedIsland = !expandedIsland;
    notifyListeners();
  }

  showIcons() {
    opacity = 1.0;
    notifyListeners();
  }

  hideIcons() {
    opacity = 0.0;
    notifyListeners();
  }
}
