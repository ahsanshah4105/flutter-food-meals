import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:food/core/widgets/image_viewer.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(backgroundColor: AppColors.appBackground),
      ),
      body: Column(
        children: [
          SizedBox(height: 31.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppStrings.profile,
                fontSize: 16.sp,
                fontFamily: AppFonts.nunitoBold,
                fontWeight: FontWeight.w700,
              ),
            ],
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
            fontSize: 20.sp,
            fontFamily: AppFonts.nunitoSemibold,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: AppStrings.email,
            fontSize: 14.sp,
            fontFamily: AppFonts.nunitoRegular,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomButton(
              onTap: () => Get.toNamed(AppRoutes.editProfile),
              buttonChild: CustomText(
                text: AppStrings.editProfile,
                fontColor: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
          ),

          Spacer(),
          CustomContainer(
            isCircle: false,
            radius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
            ),
            borderColor: AppColors.white,
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 48.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            borderColor: AppColors.white,
                            isCircle: false,
                            backgroundColor: Color(0xffEFEFEF),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: ImageViewer(
                                url: AppAssets.shieldIcon,
                                width: 18.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          CustomText(
                            text: AppStrings.privacyPolicy,
                            fontSize: 16.sp,
                            iconAfter: true,

                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            borderColor: AppColors.white,
                            isCircle: false,
                            backgroundColor: Color(0xffEFEFEF),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ImageViewer(
                                url: AppAssets.termsAndConditionsIcon,
                                width: 18.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.h),
                          CustomText(
                            text: AppStrings.termsAndConditions,
                            fontSize: 16.sp,
                            iconAfter: true,

                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            borderColor: AppColors.white,
                            isCircle: false,
                            backgroundColor: Color(0xffEFEFEF),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                AppAssets.notificationIcon,
                                width: 18.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.h),
                          CustomText(
                            text: AppStrings.notifications,
                            fontSize: 16.sp,
                            iconAfter: true,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomContainer(
                            borderColor: AppColors.white,
                            isCircle: false,
                            backgroundColor: Color(0xffEFEFEF),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ImageViewer(
                                url: AppAssets.logoutIcon,
                                width: 18.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.h),
                          CustomText(
                            text: AppStrings.logout,
                            fontSize: 16.sp,
                            iconAfter: true,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
