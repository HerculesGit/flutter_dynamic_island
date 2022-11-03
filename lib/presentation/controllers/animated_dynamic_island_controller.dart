import 'package:flutter/foundation.dart';

import '../widgets/factory/island_factory.dart';

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

    currentIsland.islandState = IslandState.normal;

    showBackButton();
    changeExpandedButtonVisibility();
  }

  didTapBackButton() {
    currentIsland.islandState = IslandState.none;
    _hideExpandedButton();
    hideBackButton();
  }

  didTapExpandButton() {
    currentIsland.islandState = IslandState.expanded;
    notifyListeners();
    _hideExpandedButton();
  }

  showDefaultIsland() {
    currentIsland.islandState = IslandState.none;
    notifyListeners();
  }

  void changeExpandedButtonVisibility() {
    if (currentIsland.expandable &&
        currentIsland.islandState == IslandState.normal) {
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
