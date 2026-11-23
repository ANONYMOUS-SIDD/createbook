import 'package:get/get.dart';

class LoaderController extends GetxController {
  var isLoading = false.obs;
  void startLoading() => isLoading.value = true;
  void stopLoading() => isLoading.value = false;
  void toggleLoading() => isLoading.value = !isLoading.value;
}
