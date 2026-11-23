import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class InputContainer extends StatelessWidget {
  final List<Widget> children;
  const InputContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Responsive.w(context, 16)),
        border: Border.all(color: AppColors.getBorderColor(context), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: Responsive.w(context, 25),
            offset: Offset(0, Responsive.h(context, 8)),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class InputDivider extends StatelessWidget {
  const InputDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.3, color: Colors.grey.shade400);
  }
}
