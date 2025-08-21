import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> sizeAnimation;
  double screenHeight = 0.0;

  @override
  void onInit() {
    super.onInit();

    screenHeight = Get.height.toDouble();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    sizeAnimation = const AlwaysStoppedAnimation<double>(0.0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      sizeAnimation = Tween<double>(
        begin: -screenHeight,
        end: 0.0,
      ).animate(animationController);

      _startSequence();
    });
  }

  Future<void> _startSequence() async {
    await _animateTo(screenHeight * 0.05, 1000);
    await _animateTo(-screenHeight * 0.005, 200);
    await _animateTo(screenHeight * 0.005, 200);
    await _animateTo(0, 100);
  }

  Future<void> _animateTo(double end, int durationMs) async {
    animationController.duration = Duration(milliseconds: durationMs);

    // re-create tween starting from current value
    sizeAnimation = Tween<double>(
      begin: sizeAnimation.value,
      end: end,
    ).animate(animationController);

    update(); // notify GetBuilder listeners (remove if you use Obx + Rx)
    await animationController.forward(from: 0);

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.OnboardingHome);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

