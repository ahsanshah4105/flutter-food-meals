import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_fonts.dart';
import 'package:food/core/widgets/custom_text.dart';
import '../utils/app_strings.dart';
import 'custom_container.dart';
import 'image_viewer.dart';

class ListCardWidget extends StatefulWidget {
  final VoidCallback onDelete;
  final int number;

  const ListCardWidget({Key? key, required this.onDelete, required this.number})
    : super(key: key);

  @override
  State<ListCardWidget> createState() => _ListCardWidgetState();
}

class _ListCardWidgetState extends State<ListCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CustomContainer(
                          child: ImageViewer(
                            url: 'assets/images/happy.png',
                            height: 21.h,
                            width: 21.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        CustomText(
                          text: "${AppStrings.happy} ${widget.number}",
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                  ),

                  ImageViewer(
                    onTap: widget.onDelete,
                    url: AppAssets.deleteIcon,
                    width: 21.w,
                    height: 21.h,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(color: AppColors.grey, thickness: 1),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          child: ImageViewer(
                            url: 'assets/images/happy.png',
                            height: 29.h,
                            width: 29.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        CustomText(text: AppStrings.pizza, fontSize: 16.sp),
                      ],
                    ),
                  ),
                  CustomText(text: AppStrings.dollarPrice, fontSize: 16.sp),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          child: ImageViewer(
                            url: 'assets/images/happy.png',
                            //imagePath: AppAssets.mealImage,
                            height: 29.h,
                            width: 29.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        CustomText(text: AppStrings.chicken, fontSize: 16.sp),
                      ],
                    ),
                  ),
                  CustomText(text: AppStrings.pizza, fontSize: 16.sp),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          child: ImageViewer(
                            url: 'assets/images/happy.png',
                            //imagePath: AppAssets.mealImage,
                            height: 29.h,
                            width: 29.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        CustomText(text: AppStrings.burger, fontSize: 16.sp),
                      ],
                    ),
                  ),
                  CustomText(text: AppStrings.pizza, fontSize: 16.sp),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(color: AppColors.grey, height: 1),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: AppStrings.dollarPrice,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.nunitoBold,
                      fontColor: AppColors.greenAccent,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: ImageViewer(
                          url: 'assets/images/happy.png',
                          //imagePath: AppAssets.happyIcon,
                          height: 11.h,
                          width: 11.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      CustomText(
                        text: AppStrings.staticDate,
                        fontColor: AppColors.grey,
                        fontFamily: AppFonts.nunitoRegular,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
