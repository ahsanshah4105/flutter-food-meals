import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';

import '../utils/app_strings.dart';
import '../utils/app_fonts.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  const AppTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(0xffF3F3F3),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: AppFonts.nunitoRegular,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: const Color(0xffA4A4A4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0xffF3F3F3),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0xffF3F3F3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0xffF3F3F3),
            width: 2,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
