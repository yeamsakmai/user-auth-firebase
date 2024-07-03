import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase1/auth/controller/auth_controlller.dart';
import 'package:flutter_firebase1/auth/model/auth_model.dart';
import 'package:flutter_firebase1/auth/view/sign_up_screen.dart';
import 'package:flutter_firebase1/auth/widget/button.dart';
import 'package:flutter_firebase1/auth/widget/input_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.put(AuthController());
  RxBool check = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 4, 129),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(250)),
              ),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    controller: emailController,
                    label: 'Email',
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => InputField(
                      controller: passwordController,
                      label: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          check.value = !check.value;
                        },
                        icon: Icon(
                          check.value == true
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ),
                      obscureText: check.value,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 270),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                      onTap: () async {
                        await authController.signInAuth(
                          AuthModel(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                      },
                      child: ButtonWidget(buttonName: 'SIGN IN')),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/icon/Google__G__logo.svg.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CupertinoButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'SIGN UP',
              style: TextStyle(
                color: Color.fromARGB(255, 250, 114, 2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: () => Get.to(SignUpScreen()),
      ),
    );
  }
}
