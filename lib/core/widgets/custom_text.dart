import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:get/get.dart';

import '../utils/app_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? fontColor;
  final String? fontFamily;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool? lineThrough;
  final bool? underLined;
  final double? lineSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onTap;
  final Icon? icon;
  final bool iconAfter;

  // Constructor with optional parameters
  const CustomText({
    super.key,
    required this.text,
    this.overflow,
    this.fontSize = 18.0,
    this.fontColor,
    this.fontFamily,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.underLined,
    this.textAlign,
    this.lineThrough,
    this.lineSpacing,
    this.onTap,
    this.icon,
    this.iconAfter = false
  });

  @override
  Widget build(BuildContext context) {
    final styledText = Text(
      text.tr,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor ?? Colors.black,
        fontFamily: fontFamily ?? AppFonts.nunitoMedium,
        fontWeight: fontWeight,
        decoration:
            (lineThrough == true)
                ? TextDecoration.lineThrough
                : (underLined == true)
                ? TextDecoration.underline
                : TextDecoration.none,
        height: lineSpacing ?? 1,
        decorationThickness: underLined == true ? 1.2 : null,
        decorationColor: fontColor ?? Colors.black,
      ),
      maxLines: maxLines ?? 2,
      textAlign: textAlign,
    );

    Widget content;
    if(icon != null ){
      content = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: iconAfter ? [
        styledText,
        SizedBox(width: 6.w),
        icon!,
          SizedBox(width: 6.w),
        ] : [
          icon!,
          SizedBox(width: 6),
          styledText,
        ],
      );

    } else {
      content = styledText;
    }

    return onTap != null
        ? GestureDetector(onTap: onTap, child: content)
        : content;
  }
}
