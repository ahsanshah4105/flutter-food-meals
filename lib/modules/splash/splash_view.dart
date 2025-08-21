import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/values/app_sizes.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:food/core/widgets/image_viewer.dart';
import 'package:get/get.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_strings.dart';
import 'controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            final double animationValue = controller.sizeAnimation.value;
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, animationValue),
                  child: Padding(
                    padding: const EdgeInsets.only().copyWith(
                      left: AppSizes.w151,
                      right: AppSizes.w151,
                    ),
                    child: ImageViewer(url: AppAssets.splash_logo),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 80 + (-animationValue)),
                  child: CustomText(
                    text: AppStrings.moodMeals,
                    fontFamily: AppFonts.sansitaSemibold,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    fontColor: AppColors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
