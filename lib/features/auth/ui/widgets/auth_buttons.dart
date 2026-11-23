import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class PrimaryAuthButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isLoading;

  const PrimaryAuthButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btnHeight = Responsive.h(context, 50).clamp(48.0, 64.0);
    final btnRadius = Responsive.w(context, 20).clamp(18.0, 26.0);

    return Container(
      width: double.infinity,
      height: btnHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.buttonGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(btnRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withOpacity(0.45),
            blurRadius: Responsive.w(context, 15),
            offset: Offset(0, Responsive.h(context, 6)),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(btnRadius),
          onTap: onPressed,
          child: isLoading
              ? Center(
                  child: SizedBox(
                    height: Responsive.w(context, 22),
                    width: Responsive.w(context, 22),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: Responsive.sp(context, 20), color: Colors.white),
                    SizedBox(width: Responsive.w(context, 10)),
                    Text(
                      text,
                      style: GoogleFonts.quicksand(
                        fontSize: Responsive.sp(context, 15),
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class SecondaryAuthButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const SecondaryAuthButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btnHeight = Responsive.h(context, 50).clamp(48.0, 64.0);
    final btnRadius = Responsive.w(context, 20).clamp(18.0, 26.0);

    return Container(
      width: double.infinity,
      height: btnHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(btnRadius),
        border: Border.all(color: AppColors.getBorderColor(context), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: Responsive.w(context, 8),
            offset: Offset(0, Responsive.h(context, 4)),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(btnRadius),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: AppColors.textGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(rect),
                child: Icon(icon, size: Responsive.sp(context, 20), color: Colors.white),
              ),
              SizedBox(width: Responsive.w(context, 10)),
              Text(
                text,
                style: GoogleFonts.quicksand(
                  fontSize: Responsive.sp(context, 15),
                  fontWeight: FontWeight.w700,
                  color: AppColors.getHintTextColor(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.getBorderColor(context), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 12)),
          child: Text(
            "OR",
            style: GoogleFonts.quicksand(
              fontSize: Responsive.sp(context, 12),
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.getBorderColor(context), thickness: 1)),
      ],
    );
  }
}
