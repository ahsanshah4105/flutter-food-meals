import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
class CustomDatePicker extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String day;
  final String date;

  const CustomDatePicker({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.day,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 68.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: isSelected ? AppColors.greenAccent : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.white : AppColors.grey,
            width: 1.5,
          ),
        ),
        child: Column(
            children: [
              SizedBox(height: 10.h,),
              Text(
                date,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.black,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.nunitoBold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                day,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.black,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.nunitoRegular,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

      ),
    );
  }
}
