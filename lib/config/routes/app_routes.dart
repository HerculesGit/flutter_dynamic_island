import 'package:flutter/material.dart';

import '../../presentation/views/home_view.dart';
import 'routes_constants.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kHomeView:
        return _materialRoute(const HomeView());
      default:
        return _materialRoute(const Scaffold(
          body: Center(child: Text('not found...')),
        ));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
