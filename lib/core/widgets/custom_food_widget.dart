import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:food/core/widgets/image_viewer.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'custom_container.dart';

class CustomFoodWidget extends StatelessWidget {
  const CustomFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 162.w,
          margin: EdgeInsets.only(right: 12.w, top: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomContainer(
                    isCircle: false,
                    height: SizeConfig.screenHeight * 0.22,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: OverflowBox(
                        maxWidth: double.infinity,
                        maxHeight: double.infinity,
                        child: ImageViewer(
                          url: 'assets/images/food_image.png',
                          //imagePath: AppAssets.mealImage,
                          width: SizeConfig.screenWidth * 0.51,
                          height: SizeConfig.screenHeight * 0.29,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: CustomContainer(
                      isCircle: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppStrings.happyHerbPasta,
                              fontFamily: AppFonts.nunitoSemibold,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: AppStrings.dollarPrice,
                                  fontFamily: AppFonts.nunitoExtraBold,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  fontColor: AppColors.greenAccent,
                                ),
                                SizedBox(width: 42.w),
                                CustomContainer(
                                  isCircle: false,
                                  radius: BorderRadius.circular(30.r),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.w),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          child: ImageViewer(
                                            url: 'assets/images/happy.png',
                                            //imagePath: AppAssets.mealImage,
                                            height: 15.h,
                                            width: 15.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.w,
                                          vertical: 6.h,
                                        ),
                                        child: CustomText(
                                          text: AppStrings.happy,
                                          fontFamily: AppFonts.nunitoRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
