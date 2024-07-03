import 'package:flutter/material.dart';
import 'package:flutter_firebase1/auth/controller/auth_controlller.dart';
import 'package:flutter_firebase1/auth/model/auth_model.dart';
import 'package:flutter_firebase1/auth/widget/button.dart';
import 'package:flutter_firebase1/auth/widget/input_field.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final RxBool check1 = true.obs;
  final RxBool check2 = true.obs;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 4, 129),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Create\nAccount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
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
                            check1.value = !check1.value;
                          },
                          icon: Icon(
                            check1.value == true
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                        ),
                        obscureText: check1.value,
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => InputField(
                        controller: confirmpassController,
                        label: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            check2.value = !check2.value;
                          },
                          icon: Icon(
                            check2.value == true
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                        ),
                        obscureText: check2.value,
                      ),
                    ),
                    SizedBox(height: 70),
                    GestureDetector(
                      onTap: () async {
                        if (passwordController.text ==
                            confirmpassController.text) {
                          await authController.signUpAuth(
                            AuthModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        } else {
                          Get.snackbar(
                            'Wrong Confirm Password',
                            "Please enter Confirm Password similar with Password",
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: ButtonWidget(buttonName: 'SIGN UP'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
