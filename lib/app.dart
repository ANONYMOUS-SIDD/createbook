import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/auth/ui/screens/login_screen.dart';

class CreatebookApp extends StatelessWidget {
  const CreatebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Createbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
