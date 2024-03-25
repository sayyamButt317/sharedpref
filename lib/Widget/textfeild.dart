import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType,
    this.cursorColor = Colors.black,
    this.labelText,
    this.hintText,
    this.labelStyle,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.decoration,
    this.text,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputDecoration? decoration;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          labelStyle: labelStyle ??
              const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, color: Colors.black) : null,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
        ),
      ),
    );
  }
}
