import 'package:flutter/material.dart';

extension BuildContextExtesion on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop([Object? result]) {
    Navigator.of(this).pop(result);
  }
}
