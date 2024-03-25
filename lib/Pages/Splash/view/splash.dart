import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Home/view/home.dart';
import '../../Signup/view/signup.dart';
import '../Controller/splashcontroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 3),
          () => Get.to(() => getxController.finalEmail == null
              ?  Signup()
              : const MyHomePage()));
    });
    super.initState();
  }

  final SplashController getxController = Get.put<SplashController>(SplashController());

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainemail = sharedPreferences.getString('email');
    var obtainfullname = sharedPreferences.getString('fullname');
    getxController.finalEmail.value = obtainemail ?? '';
    getxController.fullname.value = obtainfullname ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.local_activity),
            ),
          ],
        ),
      ),
    );
  }
}
