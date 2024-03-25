import 'package:flutter/material.dart';

import '../Pages/Splash/Controller/splashcontroller.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.formKey,
    this.controller,
    this.text,
    this.height,
    this.minWidth,
    this.padding,
    this.style,
    required this.onPressed,
  });

  final GlobalKey<FormState>? formKey;
  final SplashController? controller;
  final String? text;
  final double? height;
  final double? minWidth;
  final EdgeInsetsGeometry? padding;
  final Color? style;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height ?? 50,
      minWidth: minWidth ?? 300,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.black,
      child: Text(
        text ?? '', // Added null check here
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
