import 'dart:io';

import 'package:antripe_task/core/navigation/route_paths.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/screen_home.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    Widget widgets;

    switch (settings.name) {
      case RoutePaths.home:
        widgets = ScreenHome();
        break;
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return PopScope(
            //onWillPop: () => _onPop(context),
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                _handlePop(context, result);
              }
            },
            child: widgets,
          );
        },
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    }

    return _createRoute(settings, widgets);
  }

  static Route _createRoute(final RouteSettings settings, final widgets) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, animation, secondaryAnimation) => widgets,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // static Future<bool> _onPop(BuildContext context) async {
  //   if (Navigator.of(context).userGestureInProgress) {
  //     return Future<bool>.value(false);
  //   }
  //   return Future<bool>.value(true);
  // }

  static Future<bool> _handlePop(BuildContext context, dynamic result) {
    debugPrint("Screen popped with result: $result");
    if (Navigator
        .of(context)
        .userGestureInProgress) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}
