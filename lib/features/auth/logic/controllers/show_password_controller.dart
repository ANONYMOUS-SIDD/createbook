import 'package:get/get.dart';

class ShowPasswordController extends GetxController {
  var isPasswordVisible = true.obs;
  var isConfirmPasswordVisible = true.obs;
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
}
