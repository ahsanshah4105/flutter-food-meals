import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_food_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../controllers/home_page_controller.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final HomePageController _controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(backgroundColor: AppColors.appBackground),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomContainer(
                        width: 46.w,
                        height: 46.h,
                        borderColor: AppColors.grey,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: CustomText(
                        text: AppStrings.recipes,
                        fontFamily: AppFonts.nunitoBold,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  CustomContainer(
                    width: 46.w,
                    height: 46.h,
                    borderColor: AppColors.grey,
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomContainer(
                    width: 46.w,
                    height: 46.h,
                    borderColor: AppColors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AppAssets.replaceIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Image.asset(AppAssets.foodImage),
            ),
            // Spacer(),
            CustomContainer(
              isCircle: false,
              backgroundColor: AppColors.white,
              radius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomText(
                                text: AppStrings.happyHerbPasta,
                                fontWeight: FontWeight.w700,
                                fontFamily: AppFonts.nunitoSemibold,
                                fontSize: 20.sp,
                              ),
                            ),
                            CustomText(
                              text: AppStrings.dollarPrice,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppStrings.ingredients,
                              fontSize: 16.sp,
                            ),
                            CustomContainer(
                              isCircle: false,
                              radius: BorderRadius.circular(30.r),
                              borderColor: AppColors.greenAccent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          child: ImageViewer(
                                            url:
                                                'assets/images/bored_image.png',
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
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 10,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 13,
                                          color: AppColors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text:
                              AppStrings
                                  .chooseYourCurrentMoodToGetMealSuggestions,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.nunitoRegular,
                        ),
                        SizedBox(height: 24.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: AppStrings.relatedRecipes,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
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
                        SizedBox(height: 22.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: AppStrings.ratingAndReviews,
                              fontSize: 16.sp,
                            ),

                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4.w),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4.w),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4.w),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.star,
                                  color: AppColors.grey,
                                  size: 16,
                                ),
                                SizedBox(width: 4.w),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomContainer(
                          isCircle: false,
                          // radius: BorderRadius.only(
                          //   topLeft: Radius.circular(8.r),
                          //   bottomLeft: Radius.circular(8.r),
                          // ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffF3F3F3),
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    labelText: AppStrings.rating,
                                    labelStyle: TextStyle(
                                      fontFamily: AppFonts.nunitoRegular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Color(0xffA4A4A4),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffF3F3F3),
                                        width: 1,
                                      ),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffF3F3F3),
                                        width: 1,
                                      ),
                                    ),

                                    // When the field is focused (user is typing)
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffF3F3F3),
                                        width: 2,
                                      ), // thicker stroke
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.greenAccent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/icon_send.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grey.withValues(
                                        alpha: 0.5,
                                      ),
                                      spreadRadius: 2.r,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            color: AppColors.greenAccent,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.remove,
                                              size: 23,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13.w),
                                      Expanded(
                                        child: CustomText(
                                          text: AppStrings.dollarPrice,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(width: 13.w),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            color: AppColors.greenAccent,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.add,
                                              size: 23,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 14.w),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenAccent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 6.w),
                                    CustomContainer(
                                      borderColor: AppColors.greenAccent,
                                      isCircle: false,
                                      radius: BorderRadius.circular(8),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                        ),
                                        child: CustomText(
                                          text: AppStrings.addToCart,
                                          fontFamily: AppFonts.nunitoRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          fontColor: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFB720C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: BorderSide(
                                color: AppColors.grey,
                                width: 1.w,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/eat.svg"),
                              SizedBox(width: 6.w),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                  bottom: 13,
                                ),
                                child: CustomText(
                                  text: AppStrings.eatNow,
                                  fontFamily: AppFonts.nunitoRegular,
                                  fontWeight: FontWeight.w400,
                                  fontColor: AppColors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 29.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
