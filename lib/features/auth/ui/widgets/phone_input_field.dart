import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const PhoneInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.h(context, 60).clamp(54.0, 74.0),
      padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 16)),
      child: Row(
        children: [
          _buildPhoneIconContainer(context),
          SizedBox(width: Responsive.w(context, 12)),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
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
              maxLength: 10,
              buildCounter: (BuildContext context,
                      {required int currentLength,
                      required int? maxLength,
                      required bool isFocused}) =>
                  null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneIconContainer(BuildContext context) {
    final side = Responsive.w(context, 36).clamp(34.0, 44.0);
    return Container(
      width: side,
      height: side,
      decoration: BoxDecoration(
        color: AppColors.phoneIconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Responsive.w(context, 10)),
      ),
      child: Icon(
        Icons.phone_outlined,
        color: AppColors.phoneIconColor,
        size: Responsive.sp(context, 20),
      ),
    );
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
