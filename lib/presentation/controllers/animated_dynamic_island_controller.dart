import 'package:flutter/foundation.dart';

import '../widgets/factory/island_factory.dart';

class AnimatedDynamicIsland extends ChangeNotifier {
  late IslandFactory currentIsland;
  bool displayBackButton = false;
  bool displayExpandedButton = false;
  bool displayIslandList = true;

  final List<IslandFactory> dynamicIsland = [];

  loadDynamicIsland(List<IslandFactory> islands) {
    dynamicIsland.clear();
    dynamicIsland.addAll(islands);

    currentIsland = dynamicIsland.first;
  }

  didTapIsland(IslandFactory island) {
    currentIsland = island;

    currentIsland.changeState(IslandState.normal);

    showBackButton();
    changeExpandedButtonVisibility();
  }

  didTapBackButton() {
    currentIsland.changeState(IslandState.none);

    _hideExpandedButton();
    hideBackButton();
  }

  didTapExpandButton() {
    currentIsland.changeState(IslandState.expanded);
    notifyListeners();
    _hideExpandedButton();
  }

  showDefaultIsland() {
    currentIsland.changeState(IslandState.none);
    notifyListeners();
  }

  void changeExpandedButtonVisibility() {
    if (currentIsland.expandable &&
        currentIsland.controller.islandState == IslandState.normal) {
      _showExpandedButton();
    } else {
      _hideExpandedButton();
    }
  }

  _showExpandedButton() {
    displayExpandedButton = true;
    notifyListeners();
  }

  _hideExpandedButton() {
    displayExpandedButton = false;
    notifyListeners();
  }

  showBackButton() {
    displayBackButton = true;
    notifyListeners();
  }

  hideBackButton() {
    displayBackButton = false;
    notifyListeners();
  }
}
