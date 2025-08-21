import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/values/app_radius.dart';
import 'package:food/core/values/app_sizes.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/screen_size/size_config.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/widgets/inner_radius_box.dart';
import '../controller/on_boarding_controller.dart';

class OnBoardingHome extends StatefulWidget {
  const OnBoardingHome({super.key});

  @override
  State<OnBoardingHome> createState() => _OnBoardingHomeState();
}

class _OnBoardingHomeState extends State<OnBoardingHome> {
  final _controller = Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fullWidth = MediaQuery.of(context).size.width - 48.w;
      _controller.updateWidth(_controller.currentIndex.value, fullWidth, 114.w);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      body: Stack(
        children: [
          Obx(() {
            final imagePath =
                _controller.onboardingData[_controller
                    .currentIndex
                    .value]["image"]!;
            return Padding(
              padding: EdgeInsets.only(top: AppSizes.h97, left: AppSizes.w94),
              child: Container(
                width: AppSizes.w210,
                height: AppSizes.h454,
                child: OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only().copyWith(
                      left: AppSizes.w30,
                    ),
                    child: SvgPicture.asset(
                      imagePath,
                      width: AppSizes.w200,
                      height: AppSizes.h520,
                    ),
                  ),
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(
                SizeConfig.screenWidth,
                SizeConfig.screenHeight * 0.55,
              ),
              painter: InnerRadiusBox(outerRadius: 60, color: AppColors.white),
            ),
          ),
          PageView.builder(
            controller: _controller.pageController,
            itemCount: _controller.onboardingData.length,
            onPageChanged: (index) {
              _controller.currentIndex.value = index; // update image
            },
            itemBuilder: (context, index) {
              final data = _controller.onboardingData[index];
              return Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.screenWidth * 0.06,
                          left: SizeConfig.screenWidth * 0.08,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 494.h,
                      left: 24.w,
                      right: 24.w,
                      child: Column(
                        children: [
                          CustomText(
                            text: data[AppStrings.title]!,
                            textAlign: TextAlign.center,
                            fontFamily: AppFonts.nunitoSemibold,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                            fontColor: AppColors.black,
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text: data[AppStrings.subTitle]!,
                            textAlign: TextAlign.center,
                            fontFamily: AppFonts.nunitoRegular,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            fontColor: AppColors.transparentBlack,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 96.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller.pageController,
                count: _controller.onboardingData.length,
                effect: WormEffect(
                  dotColor: AppColors.lightGreen,
                  activeDotColor: AppColors.greenAccent,
                  dotHeight: 8.h,
                  dotWidth: 8.h,
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: AppSizes.h24,
              left: AppSizes.h24,
              right: AppSizes.h24,
              child:
                  (_controller.currentIndex.value == 0 ||
                          _controller.currentIndex.value ==
                              _controller.onboardingData.length - 1)
                      ? Obx(() {
                        return SizedBox(
                          width: _controller.currentWidth.value,
                          height: AppSizes.h48,
                          child: CustomButton(
                            onTap: _controller.nextPage,
                            buttonColor: AppColors.greenAccent,
                            borderRadius: AppRadius.r16,
                            buttonChild: CustomText(
                              text: _controller.getStartedOrNext(),
                              fontColor: AppColors.offWhite,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      })
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 114.w,
                            height: 48.h,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.r16,
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.grey,
                                ),
                              ),
                              child: CustomButton(
                                onTap: _controller.nextPage,
                                buttonColor: AppColors.white,
                                borderRadius: AppRadius.r16,
                                borderColor: AppColors.grey,
                                trailingIcon: null,
                                leadingIcon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 14.sp,
                                  color: AppColors.black,
                                ),
                                buttonChild: CustomText(
                                  text: AppStrings.back,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  fontColor: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 114.w,
                            height: 48.h,
                            child: CustomButton(
                              onTap: _controller.nextPage,
                              buttonColor: AppColors.greenAccent,
                              borderRadius: AppRadius.r16,
                              borderColor: AppColors.grey,
                              leadingIcon: null,
                              trailingIcon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14.sp,
                                color: AppColors.offWhite,
                              ),
                              buttonChild: CustomText(
                                text: AppStrings.next,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                fontColor: AppColors.offWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
