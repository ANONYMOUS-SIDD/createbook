import 'package:flutter/material.dart';

/// Central responsive scaling utility.
/// All sizes are proportional to the screen, clamped to safe limits.
class Responsive {
  static const double _baseWidth = 375.0;
  static const double _baseHeight = 812.0;

  /// Horizontal scaling — for widths, paddings, radii, icons.
  static double w(BuildContext context, double size) {
    final sw = MediaQuery.of(context).size.width;
    final scale = (sw / _baseWidth).clamp(0.85, 1.30);
    return size * scale;
  }

  /// Vertical scaling — for heights and vertical spacing.
  static double h(BuildContext context, double size) {
    final sh = MediaQuery.of(context).size.height;
    final scale = (sh / _baseHeight).clamp(0.85, 1.30);
    return size * scale;
  }

  /// Font scaling — tied to width, more conservative clamp.
  static double sp(BuildContext context, double size) {
    final sw = MediaQuery.of(context).size.width;
    final scale = (sw / _baseWidth).clamp(0.85, 1.20);
    return size * scale;
  }

  /// Header height — percentage of screen, clamped for portrait phones.
  static double headerHeight(BuildContext context, double percent,
      {double min = 200, double max = 340}) {
    final raw = MediaQuery.of(context).size.height * percent;
    return raw.clamp(min, max);
  }

  /// Max form content width on tablets.
  static double maxFormWidth(BuildContext context) {
    return MediaQuery.of(context).size.width.clamp(0.0, 500.0);
  }

  /// Horizontal form padding — percentage with floor/ceiling.
  static double formHPadding(BuildContext context) {
    return (MediaQuery.of(context).size.width * 0.05).clamp(16.0, 60.0);
  }
}
