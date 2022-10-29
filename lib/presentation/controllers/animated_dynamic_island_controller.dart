import 'package:flutter/foundation.dart';

class AnimatedDynamicIsland extends ChangeNotifier {
  bool isDefaultIcon = false;

  bool _showIcons = true;
  double opacity = 0.0;

  changeButton() async {
    isDefaultIcon = !isDefaultIcon;

    if (isDefaultIcon) {
      hideIcons();
    } else {
      showIcons();
    }
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
