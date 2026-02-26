import 'package:flutter/material.dart';

import '../navigation/services/navigation_service.dart';

class Measurement {
  // Singleton instance
  static final Measurement _instance = Measurement._internal();
  Measurement._internal();

  factory Measurement() {
    return _instance;
  }

  // Dynamically get the height
  double height() {
    final context = _getContext();
    return MediaQuery.of(context).size.height;
  }

  // Dynamically get the width
  double width() {
    final context = _getContext();
    return MediaQuery.of(context).size.width;
  }

  // Dynamically calculate aspect ratio
  double aspectRatio() {
    final context = _getContext();
    return MediaQuery.of(context).size.width / 360;
  }

  // Utility methods
  double sizeByAspectRatio(double value) => value * aspectRatio();
  double sizeByHeight(double value) => value * aspectRatio();
  double sizeByWidth(double value) => value * aspectRatio();
  double textSize(double value) => value * aspectRatio();
  double margin(double value) => value * aspectRatio();
  double padding(double value) => value * aspectRatio();
  double radius(double value) => value * aspectRatio();
  double fullWidth() => width();

  // Private method to safely get the context
  BuildContext _getContext() {
    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) {
      throw Exception(
          "Navigator key's context is null. Ensure NavigationService is properly initialized.");
    }
    return context;
  }
}

final Measurement measurement = Measurement();
