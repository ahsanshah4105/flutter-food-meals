import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_fonts.dart';
import 'package:food/core/utils/app_strings.dart';

import '../utils/app_colors.dart';
import 'custom_container.dart';
import 'custom_text.dart';

class AddMealWidgets extends StatefulWidget {
  const AddMealWidgets({super.key});

  @override
  State<AddMealWidgets> createState() => _AddMealWidgetsState();
}

class _AddMealWidgetsState extends State<AddMealWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: CustomContainer(
        width: double.infinity,
        isCircle: false,
        backgroundColor: AppColors.appBackground,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: CircleAvatar(
                    child: Icon(Icons.person_2_outlined),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppStrings.eatApple,
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  AppAssets.happyIcon,
                                  width: 11.w,
                                  height: 11,
                                ),
                                SizedBox(width: 6.w),
                                CustomText(
                                  text: AppStrings.morning,
                                  fontSize: 12.sp,
                                  fontColor: AppColors.subHeadingWhite,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                ),
                                Text(
                                  ',',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontSize: 12.sp,
                                    color: AppColors.subHeadingWhite,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                CustomText(
                                  text: AppStrings.staticTime,
                                  fontSize: 12.sp,
                                  fontColor: AppColors.subHeadingWhite,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.nunitoRegular,
                                ),

                              ],
                            ),
                      ),

                    ],
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: AppStrings.cookiesAndIceCream,
                    fontSize: 12.sp,
                    fontColor: AppColors.subHeadingWhite,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
