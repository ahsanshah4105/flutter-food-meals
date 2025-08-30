import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/core/routes/app_routes.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/widgets/base_scaffold.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:food/core/widgets/custom_container.dart';
import 'package:food/modules/connectivity/controllers/connectivity_controller.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/enums/connectivity_status.dart';
import '../../../../core/widgets/custom_food_widget.dart';
import '../../../../core/widgets/image_viewer.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = Get.find<HomePageController>();
  final ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // key change
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomContainer(borderColor: AppColors.grey),
                          SizedBox(width: 7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 3),
                              CustomText(
                                text: AppStrings.goodMorning,
                                fontSize: 15.sp,
                                fontFamily: AppFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontColor: AppColors.transparentBlack,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: AppStrings.johnDoe,
                                fontSize: 16.sp,
                                fontFamily: AppFonts.nunitoBold,
                                fontWeight: FontWeight.w600,
                                fontColor: AppColors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomContainer(
                        borderColor: AppColors.grey,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ImageViewer(
                            url: AppAssets.notificationIcon,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Divider(height: 1, color: AppColors.grey),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppStrings.upcomingMeal,
                        fontSize: 16.sp,
                        fontFamily: AppFonts.nunitoMedium,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColors.black,
                      ),
                      CustomText(
                        text: AppStrings.weeklyPlan,
                        fontSize: 16.sp,
                        fontFamily: AppFonts.nunitoMedium,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColors.black,
                        onTap: () => Get.toNamed(AppRoutes.weeklyPlan),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  CustomContainer(
                    isCircle: false,
                    backgroundColor: AppColors.greenAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: CustomText(
                                    text: AppStrings.sunday,
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.nunitoMedium,
                                    fontWeight: FontWeight.w500,
                                    fontColor: AppColors.subHeadingWhite,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 154.w),
                                  child: CustomText(
                                    text: AppStrings.joyfulGrilledChicken,
                                    fontSize: 20.sp,
                                    fontFamily: AppFonts.nunitoSemibold,
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: CustomText(
                                  text: AppStrings.staticDate,
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                  fontColor: AppColors.subHeadingWhite,
                                ),
                              ),
                              SizedBox(height: 11),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 11),
                          child: SizedBox(
                            width: 140.w,
                            height: 140.h,
                            child: ClipOval(
                              child: ImageViewer(
                                width: 140.w,
                                height: 140.h,
                                fit: BoxFit.cover,
                                url: 'assets/images/meal_image.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppStrings.favouriteMeals,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12),
                  Obx(
                    () => SizedBox(
                      height: SizeConfig.screenHeight * 0.25,
                      child: ListView.builder(
                        controller: _controller.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller.items.value,
                        itemBuilder: (context, index) {
                          return CustomFoodWidget();
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppStrings.howAreYouFeelingToday,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.nunitoBold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomText(
                    text: AppStrings.chooseMoodToGetMealSuggestions,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.nunitoRegular,
                    fontSize: 12.sp,
                    fontColor: AppColors.transparentBlack,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        onTap: () => Get.toNamed(AppRoutes.recipes),
                        isCircle: false,
                        borderWidth: 1,
                        radius: BorderRadius.circular(30.r),
                        borderColor: AppColors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: ImageViewer(
                                      url: 'assets/images/happy.png',
                                      //imagePath: AppAssets.mealImage,
                                      height: 24.h,
                                      width: 24.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: CustomText(
                                    text: AppStrings.happy,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13,
                                      color: AppColors.orange,
                                    ),
                                    iconAfter: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomContainer(
                        onTap: () => Get.toNamed(AppRoutes.recipes),
                        isCircle: false,
                        borderWidth: 1,
                        radius: BorderRadius.circular(30.r),
                        borderColor: AppColors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: ImageViewer(
                                      url: 'assets/images/bored_image.png',
                                      //imagePath: AppAssets.mealImage,
                                      height: 24.h,
                                      width: 24.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: CustomText(
                                    text: AppStrings.bored,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13,
                                      color: AppColors.orange,
                                    ),
                                    iconAfter: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomContainer(
                        onTap: () => Get.toNamed(AppRoutes.recipes),
                        isCircle: false,
                        borderWidth: 1,
                        radius: BorderRadius.circular(30.r),
                        borderColor: AppColors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: ImageViewer(
                                      url: 'assets/images/tired_image.png',
                                      //imagePath: AppAssets.mealImage,
                                      height: 24.h,
                                      width: 24.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 3,
                                  ),
                                  child: CustomText(
                                    text: AppStrings.tired,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13,
                                      color: AppColors.orange,
                                    ),
                                    iconAfter: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 26),
                  CustomText(
                    text: AppStrings.pleaseSelectAFeeling,
                    fontSize: 13.sp,
                    fontColor: AppColors.greenAccent,
                  ),
                  SizedBox(height: 26),
                ],
              ),
            ),
          ),
          Obx(() {
            final isOffline = _connectivityController.status.value == ConnectivityStatus.Offline;
            return Visibility(
              visible: isOffline,
              child: Opacity(
                opacity: 0.7,
                child: BaseScaffold(
                  statusBarColor: AppColors.error,
                  body: Container(
                    color: AppColors.black.withOpacity(0.7),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  backgroundColor: Colors.transparent,
                  top: true,
                  bottom: true,
                ),
              ),
            );
          })


          // Container(
         //   child:  Obx(() => Visibility(
         //     visible: _connectivityController.status.value == ConnectivityStatus.Offline,
         //     child: Container(
         //       color: AppColors.black.withOpacity(0.7),
         //       height: double.infinity,
         //       width: double.infinity,
         //     ),
         //   ),
         //   ),
         // )

        ],
      ),
    );
  }
}
