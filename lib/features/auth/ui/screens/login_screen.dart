import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/loader_controller.dart';
import '../../logic/controllers/show_password_controller.dart';
import '../../data/services/auth_service.dart';
import '../../../../core/services/toast_service.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../utils/auth_utils.dart';
import '../utils/validators.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/auth_header.dart';
import '../widgets/input_container.dart';
import '../widgets/input_fields.dart';
import '../../../main/main_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthService authService = Get.find<AuthService>();
  final LoaderController loaderController = Get.find<LoaderController>();
  final ShowPasswordController showPasswordController = Get.find<ShowPasswordController>();
  final AuthController authController = Get.find<AuthController>();
  final ToastService toastService = Get.find<ToastService>();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> _handleLogin() async {
    if (!formKey.currentState!.validate()) return;

    loaderController.startLoading();
    final user = await authService.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    loaderController.stopLoading();

    if (user != null) {
      authController.initializeUserSession();
      toastService.showSuccessMessage("Login Successful!");
      Get.offAll(() => const MainScreen());
    }
  }

  Future<void> _handleForgotPassword() async {
    if (emailController.text.isEmpty) {
      toastService.showErrorMessage("Enter Email To Reset Password");
      return;
    }
    final emailError = AuthValidators.validateEmail(emailController.text.trim());
    if (emailError != null) {
      toastService.showErrorMessage("Enter Valid Email To Reset Password");
      return;
    }
    loaderController.startLoading();
    final success = await authService.sendPasswordResetEmail(emailController.text.trim());
    loaderController.stopLoading();
    if (success) toastService.showSuccessMessage("Forgot Password Email Sent");
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
                  height: Responsive.headerHeight(context, 0.38, min: 220, max: 340),
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
                Responsive.h(context, 22),
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
                      _buildForgotPassword(context),
                      _buildActionButtons(context),
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
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: GoogleFonts.quicksand(
            fontSize: Responsive.sp(context, 22),
            fontWeight: FontWeight.w800,
            foreground: Paint()
              ..shader = const LinearGradient(colors: AppColors.textGradient)
                  .createShader(const Rect.fromLTWH(0, 0, 200, 70)),
          ),
        ),
        SizedBox(height: Responsive.h(context, 20)),
      ],
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return InputContainer(
      children: [
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
      ],
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: Responsive.h(context, 16), right: Responsive.w(context, 4)),
      child: GestureDetector(
        onTap: _handleForgotPassword,
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.quicksand(
            fontSize: Responsive.sp(context, 13),
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Responsive.h(context, 24)),
        Obx(() => PrimaryAuthButton(
              text: "Login To Your Account",
              icon: Icons.login_rounded,
              onPressed: _handleLogin,
              isLoading: loaderController.isLoading.value,
            )),
        SizedBox(height: Responsive.h(context, 20)),
        const OrDivider(),
        SizedBox(height: Responsive.h(context, 20)),
        SecondaryAuthButton(
          text: "Create New Account",
          icon: Icons.person_add_rounded,
          onPressed: () => Get.off(() => SignUpScreen()),
        ),
      ],
    );
  }
}
