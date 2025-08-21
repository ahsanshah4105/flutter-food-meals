import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddMealsPage extends StatefulWidget {
  const AddMealsPage({super.key});

  @override
  State<AddMealsPage> createState() => _AddMealsPageState();
}

class _AddMealsPageState extends State<AddMealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.10),
        child: AppBar(backgroundColor: AppColors.greenAccent),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 26.h),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomContainer(
                  width: 46.w,
                  height: 46.h,
                  radius: BorderRadius.circular(50.r),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.black,
                    size: 16,
                  ),
                ),
              ),
              Center(
                child: CustomText(
                  text: AppStrings.addNewMeal,
                  fontFamily: AppFonts.nunitoBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: const EdgeInsets.only(left: 83, right: 83),
            child: Image.asset(AppAssets.mealBackgroundImage),
          ),
          SizedBox(height: 7.h),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: AppStrings.mealName, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  labelText: AppStrings.enterName,
                  onChanged: (value) {
                    print("Name: $value");
                  },
                ),


                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: AppStrings.day, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  labelText: AppStrings.enterEmail,
                  onChanged: (value) {
                    print("Name: $value");
                  },
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: AppStrings.time, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  labelText: AppStrings.enterEmail,
                  onChanged: (value) {
                    print("Name: $value");
                  },
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: AppStrings.mealName, fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                CustomContainer(
                  isCircle: false,
                  height: SizeConfig.screenHeight * 0.14,
                  backgroundColor: Color(0xffF3F3F3),
                  child: AppTextField(
                    labelText: AppStrings.typeHere,
                    onChanged: (value) {
                      print("Name: $value");
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          side: BorderSide(color: AppColors.grey, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),

                        child: CustomText(
                          text: AppStrings.cancel,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 9.h),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenAccent,
                          side: BorderSide(
                            color: AppColors.greenAccent,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),

                        child: CustomText(
                          text: AppStrings.add,
                          fontSize: 16.sp,
                          fontColor: AppColors.white,
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
