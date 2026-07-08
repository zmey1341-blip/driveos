import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get isMobile => width < 600;

  bool get isTablet => width >= 600 && width < 1200;

  bool get isDesktop => width >= 1200;
}
