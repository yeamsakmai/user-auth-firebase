import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase1/auth/model/auth_model.dart';
import 'package:flutter_firebase1/auth/view/sign_in_screen.dart';
import 'package:flutter_firebase1/home/view/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loading = true.obs;
  @override
  void onInit() {
    onCheckUser();
    super.onInit();
  }

  Future signUpAuth(AuthModel authModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      if (credential.user != null) {
        Get.snackbar('Success', 'Account create success',
            colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Invalid', 'Something wrong', colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Invalid', 'Something wrong', colorText: Colors.white);
      } else {
        Get.snackbar('Invalid', 'Something wrong', colorText: Colors.white);
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future signInAuth(AuthModel authModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      if (credential.user != null) {
        Get.offAll(HomeScreen());
        Get.snackbar('Success', 'Account login success',
            colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Invalid', 'Something wrong', colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Invalid', 'Something wrong', colorText: Colors.white);
      }
    }
    update();
  }

  Future onCheckUser() async {
    await Future.delayed(const Duration(seconds: 3));
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Get.offAll(SignInScreen());
        } else {
          Get.offAll(HomeScreen());
        }
      },
    );
  }

  Future singOutAuth() async {
    await FirebaseAuth.instance.signOut();
  }
}
