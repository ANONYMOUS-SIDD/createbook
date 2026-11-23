import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/controllers/show_password_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final Color iconColor;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isConfirmPassword;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.iconColor,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isConfirmPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showPasswordController = Get.find<ShowPasswordController>();
    return Container(
      height: Responsive.h(context, 60).clamp(54.0, 74.0),
      padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 16)),
      child: Row(
        children: [
          _buildIconContainer(context),
          SizedBox(width: Responsive.w(context, 12)),
          Expanded(
            child: isPassword
                ? _buildPasswordField(showPasswordController, context)
                : _buildNormalField(context),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context) {
    final side = Responsive.w(context, 36).clamp(34.0, 44.0);
    return Container(
      width: side,
      height: side,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Responsive.w(context, 10)),
      ),
      child: Icon(icon, color: iconColor, size: Responsive.sp(context, 20)),
    );
  }

  Widget _buildNormalField(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.quicksand(
        fontSize: Responsive.sp(context, 15),
        fontWeight: FontWeight.w700,
        color: AppColors.textColor,
      ),
      cursorColor: AppColors.primaryBlue,
      cursorHeight: Responsive.sp(context, 20),
      cursorWidth: 2,
      cursorRadius: const Radius.circular(3),
      decoration: _buildInputDecoration(context),
      validator: validator,
    );
  }

  Widget _buildPasswordField(
      ShowPasswordController passwordVisibilityController,
      BuildContext context,
      ) {
    return Obx(() {
      final isVisible = isConfirmPassword
          ? passwordVisibilityController.isConfirmPasswordVisible.value
          : passwordVisibilityController.isPasswordVisible.value;

      final toggleSide = Responsive.w(context, 36).clamp(34.0, 44.0);

      return Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            controller: controller,
            obscureText: !isVisible,
            textAlignVertical: TextAlignVertical.center,
            style: GoogleFonts.quicksand(
              fontSize: Responsive.sp(context, 15),
              fontWeight: FontWeight.w700,
              color: AppColors.textColor,
            ),
            cursorColor: AppColors.primaryBlue,
            cursorHeight: Responsive.sp(context, 20),
            cursorWidth: 2,
            cursorRadius: const Radius.circular(3),
            decoration: _buildInputDecoration(context).copyWith(
              contentPadding: EdgeInsets.only(
                top: Responsive.h(context, 15),
                right: toggleSide + Responsive.w(context, 6),
              ),
            ),
            validator: validator,
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: isConfirmPassword
                  ? passwordVisibilityController.toggleConfirmPasswordVisibility
                  : passwordVisibilityController.togglePasswordVisibility,
              child: Container(
                width: toggleSide,
                height: toggleSide,
                padding: EdgeInsets.all(Responsive.w(context, 8)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  isVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                  color: Colors.grey.shade500,
                  size: Responsive.sp(context, 20),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.quicksand(
        color: AppColors.getHintTextColor(context),
        fontSize: Responsive.sp(context, 14),
        fontWeight: FontWeight.w700,
        height: 1.0,
      ),
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      helperText: ' ',
      helperStyle: TextStyle(
        height: 0.8,
        fontSize: Responsive.sp(context, 14),
        color: Colors.transparent,
      ),
      errorStyle: GoogleFonts.quicksand(
        fontSize: Responsive.sp(context, 10),
        fontWeight: FontWeight.w600,
        color: AppColors.errorRed,
        height: 1.0,
      ),
      contentPadding: EdgeInsets.only(top: Responsive.h(context, 15)),
      isDense: true,
      alignLabelWithHint: true,
    );
  }
}
