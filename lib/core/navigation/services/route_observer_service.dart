import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteObserverService extends NavigatorObserver {
  String? currentRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    currentRoute = route.settings.name;
    if (kDebugMode) {
      print("Pushed: $currentRoute");
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    currentRoute = previousRoute?.settings.name;
    if (kDebugMode) {
      print("Popped to: $currentRoute");
    }
    super.didPop(route, previousRoute);
  }
}
