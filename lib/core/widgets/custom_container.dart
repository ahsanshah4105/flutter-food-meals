import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';

import '../utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final double size;
  final double? width;
  final double? height;
  final double padding;
  final double borderWidth;
  final Color borderColor;
  final BorderRadius? radius;
  final Color backgroundColor;
  final IconData? icon;
  final double iconSize;
  final Color iconColor;
  final VoidCallback? onTap;
  final Widget? child;
  final bool isCircle;
  final EdgeInsets? margin;

  const CustomContainer({
    super.key,
    this.size = 12,
    this.width,
    this.height,
    this.icon = Icons.person,
    this.padding = 2.0,
    this.radius,
    this.borderWidth = 1.0,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.iconSize = 36.0,
    this.iconColor = Colors.black,
    this.onTap,
    this.child,
    this.isCircle = true,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: width?.w,
      height: height?.h,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: Border.all(color: borderColor, width: borderWidth.w),
        borderRadius: isCircle ? null : (radius ?? BorderRadius.circular(16.r)),
      ),
      child: child ?? CircleAvatar(
        backgroundColor: backgroundColor,
        child: Icon(icon, size: iconSize , color: iconColor),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: content,
    );
  }
}
