import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart'; // Make sure this is configured properly
import 'package:food/core/utils/app_fonts.dart';
import 'package:food/core/widgets/add_meal_widgets.dart';
import 'package:food/core/widgets/custom_date_picker.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:food/core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_container.dart';
import '../controllers/weekly_plan_controller.dart';

class WeeklyPlan extends StatefulWidget {
  const WeeklyPlan({super.key});

  @override
  State<WeeklyPlan> createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {
  final WeeklyPlanController _controller = Get.find<WeeklyPlanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: AppBar(backgroundColor: AppColors.greenAccent, elevation: 0),
      ),
      body: CustomContainer(
        radius: BorderRadius.circular(0.r),
        isCircle: false,
        backgroundColor: Color(0xffFFFFFF),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: 66.h),
                  Center(
                    child: CustomText(
                      text: AppStrings.weeklyPlan,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomContainer(
                      width: 46.w,
                      height: 46.h,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                        color: AppColors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomText(
                        text: "${_controller.day}",
                          fontSize: 20.sp,
                          fontFamily: AppFonts.nunitoSemibold,
                          fontWeight: FontWeight.w600,

                      ),
                    ),
                    SizedBox(height: 4.h),
                    Obx(
                      () => CustomText(
                        text: "${_controller.month}, ${_controller.year}",
                          fontFamily: AppFonts.nunitoSemibold,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.dateList.length,
                itemBuilder: (context, index) {
                  final dateMap = _controller.dateList[index];
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomDatePicker(
                        day: dateMap['day']!,
                        date: dateMap['date']!,
                        isSelected: _controller.selectedIndex.value == index,
                        onTap: () {
                          _controller.selectDate(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  CustomText(
                    text: AppStrings.plan,
                      fontSize: 20.sp,
                    ),
                  SizedBox(width: 2,),
                  CustomText(
                    text: AppStrings.sunday,
                      fontSize: 14.sp,
                      fontColor: AppColors.subHeadingWhite,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 5),
                    itemCount: _controller.mealItems.length,
                    itemBuilder: (context, index) {
                      return AddMealWidgets();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.addMeals),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: CustomContainer(
                  isCircle: false,
                  borderColor:  AppColors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 20, color: AppColors.black),
                        SizedBox(width: 10),
                        CustomText(
                          text: AppStrings.addMoreMeal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: AppFonts.nunitoSemibold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
