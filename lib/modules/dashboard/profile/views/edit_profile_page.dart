import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:get/get.dart';
import '../../../../core/constants/edit_field_type.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../home/controllers/add_meal_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final AddMealController _addMealController = Get.put(AddMealController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(backgroundColor: AppColors.appBackground),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomContainer(
                    borderColor: AppColors.grey,
                    width: 46.w,
                    height: 46.h,
                    isCircle: false,
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
                    text: AppStrings.editProfile,
                    fontFamily: AppFonts.nunitoBold,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          CustomContainer(
            borderColor: AppColors.grey,
            isCircle: false,
            radius: BorderRadius.circular(50.r),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Color(0xffEFEFEF),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 30.r,
                  color: Color(0xffBEBEBE),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: AppStrings.johnDoe,
            fontFamily: AppFonts.nunitoSemibold,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),

          SizedBox(height: 4.h),
          CustomText(
            text: AppStrings.email,
            fontColor: AppColors.grey,
            fontFamily: AppFonts.nunitoRegular,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),

          SizedBox(height: 16),
          Spacer(),
          CustomContainer(
            backgroundColor: AppColors.white,
            radius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
            ),
            isCircle: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 48.h),
                  GestureDetector(
                    onTap:
                        () => _addMealController.showEditDialog(
                          context,
                          EditFieldType.name,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomContainer(
                              backgroundColor: Color(0xffEFEFEF),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Icon(
                                  Icons.person_2_outlined,
                                  size: 20.r,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            CustomText(text: AppStrings.name, fontSize: 16.sp),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: AppStrings.johnDoe,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              fontColor: AppColors.subHeadingWhite,
                              fontSize: 14.sp,
                            ),
                            SizedBox(width: 19.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                              size: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap:
                        () => _addMealController.showEditDialog(
                          context,
                          EditFieldType.password,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomContainer(
                              backgroundColor: Color(0xffEFEFEF),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.lock_outline, size: 20.r),
                              ),
                            ),
                            SizedBox(width: 16.h),
                            CustomText(
                              text: AppStrings.password,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: AppStrings.password,
                              fontSize: 14.sp,
                              fontColor: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.nunitoRegular,
                            ),
                            SizedBox(width: 19.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                              size: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap:
                        () => _addMealController.showEditDialog(
                          context,
                          EditFieldType.email,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomContainer(
                              backgroundColor: Color(0xffEFEFEF),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.email_outlined, size: 20.r),
                              ),
                            ),
                            SizedBox(width: 16.h),
                            CustomText(
                              text: AppStrings.eEmail,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: AppStrings.email,
                              fontSize: 14.sp,
                              fontColor: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.nunitoRegular,
                            ),
                            SizedBox(width: 19.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                              size: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap:
                        () => _addMealController.showEditDialog(
                          context,
                          EditFieldType.phone,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomContainer(
                              backgroundColor: Color(0xffEFEFEF),
                              borderColor: Color(0xffEFEFEF),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.call_outlined, size: 20.r),
                              ),
                            ),
                            SizedBox(width: 16.h),
                            CustomText(text: AppStrings.phone, fontSize: 16.sp),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: AppStrings.phoneNo,
                              fontSize: 14.sp,
                              fontColor: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.nunitoRegular,
                            ),
                            SizedBox(width: 19.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                              size: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
