import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'custom_container.dart';
import 'custom_text.dart';

class CustomCartsWidget extends StatefulWidget {
  const CustomCartsWidget({super.key});

  @override
  State<CustomCartsWidget> createState() => _CustomCartsWidgetState();
}

class _CustomCartsWidgetState extends State<CustomCartsWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.white,
      isCircle: false,
      padding: 12.w,
      margin: EdgeInsets.only(bottom: 12),
      backgroundColor: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            child: Icon(
              Icons.person,
              size: 82.w,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: AppStrings.pastaSaladWithVeg,
                        fontSize: 16.sp,
                      ),
                    ),
                    CustomContainer(
                      isCircle: false,
                      radius: BorderRadius.circular(5.r),
                      backgroundColor: AppColors.white,
                      child: Image.asset(
                        AppAssets.deleteIcon,
                        width: 23.w,
                        height: 23.h,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: AppStrings.colorFullBowlWithVeg,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w400,
                  fontColor: AppColors.transparentBlack,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.dollarPrice,
                      fontSize: 12.sp,
                      fontFamily: AppFonts.nunitoBold,
                      fontWeight: FontWeight.w700,
                      fontColor: AppColors.greenAccent,
                    ),
                    CustomContainer(
                      isCircle: false,
                      radius: BorderRadius.circular(16.r),
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.greenAccent,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 23,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(width: 13.w),
                            CustomText(
                              text: AppStrings.dollarPrice,
                              fontSize: 12.sp,
                              fontFamily: AppFonts.nunitoSemibold,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 13.w),
                            CustomContainer(
                              radius: BorderRadius.circular(5.r),
                              backgroundColor: AppColors.greenAccent,
                              child: Icon(
                                Icons.add,
                                size: 23,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
