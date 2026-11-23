import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/responsive.dart';

class AuthHeader extends StatelessWidget {
  final double height;
  final String animationPath;
  final String backgroundImagePath;

  const AuthHeader({
    Key? key,
    required this.height,
    required this.animationPath,
    required this.backgroundImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final overlap = Responsive.h(context, 40);
    return Container(
      height: height + overlap,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E3A8A), Color(0xFF0F172A)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: overlap),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.w(context, 22),
            ),
            child: Lottie.asset(
              animationPath,
              fit: BoxFit.contain,
              repeat: true,
              height: height * 0.64,
            ),
          ),
        ),
      ),
    );
  }
}
