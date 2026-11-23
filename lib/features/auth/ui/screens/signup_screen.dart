import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/loader_controller.dart';
import '../../logic/controllers/show_password_controller.dart';
import '../../data/services/auth_service.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../utils/auth_utils.dart';
import '../utils/validators.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/auth_header.dart';
import '../widgets/input_container.dart';
import '../widgets/input_fields.dart';
import '../widgets/phone_input_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService authService = Get.find<AuthService>();
  final LoaderController loaderController = Get.find<LoaderController>();
  final ShowPasswordController showPasswordController = Get.find<ShowPasswordController>();
  final AuthController authController = Get.find<AuthController>();

  SignUpScreen({super.key});

  Future<void> _handleSignUp() async {
    if (!formKey.currentState!.validate()) return;

    loaderController.startLoading();
    final user = await authService.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullName: fullNameController.text.trim(),
      phone: phoneController.text.trim(),
    );
    loaderController.stopLoading();

    if (user != null) {
      authController.initializeUserSession();
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bottomInset = AuthUtils.getBottomInset(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            ...AuthUtils.buildBackgroundGradients(context),
            Column(
              children: [
                AuthHeader(
                  height: Responsive.headerHeight(context, 0.28, min: 170, max: 260),
                  animationPath: 'assets/images/lock_animation.json',
                  backgroundImagePath: 'assets/images/auth_background.jpg',
                ),
                Expanded(
                  child: _buildFormSection(context, bottomInset),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection(BuildContext context, double bottomInset) {
    final overlap = Responsive.h(context, 40);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -overlap,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Responsive.w(context, 32)),
                topRight: Radius.circular(Responsive.w(context, 32)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: Responsive.w(context, 25),
                  offset: Offset(0, -Responsive.h(context, 8)),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                Responsive.formHPadding(context),
                Responsive.h(context, 14),
                Responsive.formHPadding(context),
                bottomInset,
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Responsive.maxFormWidth(context)),
                  child: Column(
                    children: [
                      _buildTitle(context),
                      _buildInputFields(context),
                      _buildActionButtons(context),
                      _buildPrivacyNotice(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Responsive.h(context, 10)),
      child: Text(
        "Create Account",
        style: GoogleFonts.quicksand(
          fontSize: Responsive.sp(context, 22),
          fontWeight: FontWeight.w800,
          foreground: Paint()
            ..shader = const LinearGradient(colors: AppColors.textGradient)
                .createShader(const Rect.fromLTWH(0, 0, 200, 70)),
        ),
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return InputContainer(
      children: [
        CustomInputField(
          controller: fullNameController,
          icon: Icons.person_2_rounded,
          iconColor: AppColors.nameIconColor,
          hintText: "Full Name",
          validator: AuthValidators.validateFullName,
          keyboardType: TextInputType.name,
        ),
        const InputDivider(),
        PhoneInputField(
          controller: phoneController,
          hintText: "Phone Number",
          validator: AuthValidators.validateNepaliPhone,
        ),
        const InputDivider(),
        CustomInputField(
          controller: emailController,
          icon: Icons.email_rounded,
          iconColor: AppColors.emailIconColor,
          hintText: "Email Address",
          validator: AuthValidators.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        const InputDivider(),
        CustomInputField(
          controller: passwordController,
          icon: Icons.lock_rounded,
          iconColor: AppColors.passwordIconColor,
          hintText: "Password",
          validator: AuthValidators.validatePassword,
          isPassword: true,
        ),
        const InputDivider(),
        CustomInputField(
          controller: confirmPasswordController,
          icon: Icons.lock_rounded,
          iconColor: AppColors.confirmPasswordIconColor,
          hintText: "Confirm Password",
          validator: (value) =>
              AuthValidators.validateConfirmPassword(value, passwordController.text),
          isPassword: true,
          isConfirmPassword: true,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Responsive.h(context, 20)),
        Obx(() => PrimaryAuthButton(
              text: "Create Your Account",
              icon: Icons.rocket_launch_rounded,
              onPressed: _handleSignUp,
              isLoading: loaderController.isLoading.value,
            )),
        SizedBox(height: Responsive.h(context, 15)),
        const OrDivider(),
        SizedBox(height: Responsive.h(context, 15)),
        SecondaryAuthButton(
          text: "Use Existing Account",
          icon: Icons.person,
          onPressed: () => Get.off(() => LoginScreen()),
        ),
        SizedBox(height: Responsive.h(context, 15)),
      ],
    );
  }

  Widget _buildPrivacyNotice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 10)),
      child: Text(
        "By Signing Up, You Agree To Our Terms & Privacy Policy",
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
          fontSize: Responsive.sp(context, 10),
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
