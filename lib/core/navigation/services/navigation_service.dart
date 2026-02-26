import 'package:flutter/cupertino.dart';

class NavigationService {
  // static final NavigationService _instance = NavigationService._internal();
  // NavigationService._internal();
  // factory NavigationService() => _instance;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  BuildContext? getContext() {
    return navigatorKey.currentContext;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToWithNav(Widget widget, BuildContext ctx,
      {dynamic arguments}) async {
    final NavigatorState navigator = Navigator.of(ctx, rootNavigator: true);

    return navigator.push(CupertinoPageRoute(
        settings: RouteSettings(arguments: arguments),
        builder: (final context) => widget));
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  navigateReplaced(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic goBack([dynamic popValue]) {
    return navigatorKey.currentState!.pop(popValue);
  }

  void popUntilNamed(String routeName) async => navigatorKey.currentState!
      .popUntil((route) => route.settings.name == routeName);

  void popToFirst() =>
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
