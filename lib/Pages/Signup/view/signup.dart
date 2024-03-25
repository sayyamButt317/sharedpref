import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../Widget/btn.dart';
import '../../../Widget/textfeild.dart';
import '../../Home/view/home.dart';
import '../../Splash/Controller/splashcontroller.dart';

class Signup extends GetView<SplashController> {
  Signup({super.key});

  final _formKey = GlobalKey<FormState>();

  var passwordVisible;
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text(
          'Register',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.name,
                      prefixIcon: Icons.person,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        hintText: "Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Name!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: controller.email,
                      prefixIcon: Icons.alternate_email,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: controller.password,
                      prefixIcon: Icons.lock,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      validator: (String? password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter your password';
                        }

                        if (password.length < 6) {
                          return 'Your password is too short';
                        } else if (password.length < 8) {
                          return 'Your password is acceptable but not strong';
                        }
                        if (!letterReg.hasMatch(password) ||
                            !numReg.hasMatch(password)) {
                          return 'Add special Character and Captial and small Alphabet ';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Row(
                children: [
                  AppButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString(
                            'fullname', controller.name.text);
                        sharedPreferences.setString(
                            'email', controller.email.text);

                        Get.offAll(() => const MyHomePage());
                      }
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
