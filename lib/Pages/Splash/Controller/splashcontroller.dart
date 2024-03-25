import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxString finalEmail = "".obs;
  RxString fullname = "".obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
}
