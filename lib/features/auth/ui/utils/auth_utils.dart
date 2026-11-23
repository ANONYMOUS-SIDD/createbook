import 'package:flutter/material.dart';
import '../../../../core/utils/responsive.dart';

class AuthUtils {
  static double getResponsiveHeight(BuildContext context, double factor) =>
      MediaQuery.of(context).size.height * factor;

  static double getResponsiveWidth(BuildContext context, double factor) =>
      MediaQuery.of(context).size.width * factor;

  static double getBottomInset(BuildContext context) =>
      Responsive.h(context, 20);

  static List<Widget> buildBackgroundGradients(BuildContext context) {
    return [
      Positioned(
        top: -100,
        right: -100,
        child: Container(
          width: Responsive.w(context, 300),
          height: Responsive.w(context, 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              const Color(0xFF6366F1).withOpacity(0.15),
              const Color(0xFF8B5CF6).withOpacity(0.0),
            ]),
          ),
        ),
      ),
      Positioned(
        bottom: -100,
        left: -100,
        child: Container(
          width: Responsive.w(context, 300),
          height: Responsive.w(context, 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              const Color(0xFFFF6B95).withOpacity(0.15),
              const Color(0xFF6366F1).withOpacity(0.0),
            ]),
          ),
        ),
      ),
    ];
  }
}
