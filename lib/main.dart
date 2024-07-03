import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase1/auth/controller/auth_controlller.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => log("success"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Visibility(
          visible: authController.loading.value,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
