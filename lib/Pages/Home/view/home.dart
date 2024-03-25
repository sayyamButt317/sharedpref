import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Signup/view/signup.dart';
import '../../Splash/Controller/splashcontroller.dart';

class MyHomePage extends GetView<SplashController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(controller.finalEmail.value),
          Text(controller.fullname.value),
          IconButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                sharedPreferences.remove("fullname");
                Get.offAll(() => Signup());
              },
              icon: const Icon(Icons.lock))
        ],
      )),
    );
  }
}
