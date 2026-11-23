import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/firebase_service.dart';
import 'core/services/supabase_service.dart';
import 'core/services/toast_service.dart';
import 'features/auth/data/services/auth_service.dart';
import 'features/auth/logic/controllers/auth_controller.dart';
import 'features/auth/logic/controllers/loader_controller.dart';
import 'features/auth/logic/controllers/show_password_controller.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initialize();
  await SupabaseService.initialize();

  // Register GetX services & controllers
  Get.put(ToastService(), permanent: true);
  Get.put(AuthService(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(LoaderController(), permanent: true);
  Get.put(ShowPasswordController(), permanent: true);

  runApp(const CreatebookApp());
}
