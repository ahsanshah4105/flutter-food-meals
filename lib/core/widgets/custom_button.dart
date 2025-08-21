import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_strings.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String? buttonText;
  final Widget? buttonChild;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback onTap;
  final bool? showBorder;
  final bool? avoidDuplication;
  final Color? borderColor;
  final double? buttonTextSize;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  //

  const CustomButton({
    super.key,
    this.buttonColor,
    this.buttonText,
    this.buttonChild,
    this.buttonTextColor,
    this.buttonTextSize,
    this.height,
    this.showBorder,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.avoidDuplication,
    required this.onTap,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = (borderRadius ?? 16).toDouble();

    Widget content;
    if (buttonChild != null) {
      content = buttonChild!;
    } else {
      content = CustomText(
        text: buttonText ?? AppStrings.next,
        fontColor: buttonTextColor ?? AppColors.white,
        fontSize: buttonTextSize ?? 18.sp,
        fontFamily: AppFonts.nunitoRegular,
        fontWeight: FontWeight.w400,
      );
    }

    if (leadingIcon != null || trailingIcon != null) {
      final children = <Widget>[];
      if (leadingIcon != null) {
        children.add(Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: leadingIcon!,
        ));
      }

      children.add(Flexible(child: content));

      if (trailingIcon != null) {
        children.add(Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: trailingIcon!,
        ));
      }

      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height ?? 50.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: (showBorder ?? false)
                  ? (borderColor ?? AppColors.primary)
                  : Colors.transparent,
            ),
            color: buttonColor ?? AppColors.greenAccent,
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: Alignment.center,
          child: content,
        ),
      ),
    );
  }
}
