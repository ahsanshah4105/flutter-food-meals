import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? bottomNavBar;
  final Widget? fab;
  bool? top;
  bool? bottom;
  bool? resizeToAvoidBottomInset;
  Color? backgroundColor;
  Color? statusBarColor;
  Brightness? statusBarIconBrightness;
  DeviceOrientation? deviceOrientation;

  BaseScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavBar,
    this.fab,
    this.top,
    this.bottom,
    this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.resizeToAvoidBottomInset,
    this.deviceOrientation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? (statusBarIconBrightness == Brightness.light
              ? AppColors.primary
              : AppColors.white),
          statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        ),
      );
    });

    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(top: top ?? false, bottom: bottom ?? false, child: body),
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
