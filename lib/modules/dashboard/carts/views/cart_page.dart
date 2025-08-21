import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_fonts.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_carts_widget.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text.dart';
import '../controllers/carts_page_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartsPageController _controller = Get.find<CartsPageController>();

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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 46.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.grey, width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.black,
                    size: 16,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: CustomText(
                      text: AppStrings.myCart,
                      fontColor: AppColors.black,
                      fontFamily: AppFonts.nunitoBold,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: CustomContainer(
                    isCircle: false,
                    radius: BorderRadius.circular(50.r),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 32.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.only(top: 8.0),
                  itemCount: _controller.items.value,
                  scrollDirection: Axis.vertical,
                  controller: _controller.scrollController,
                  itemBuilder: (context, index) {
                    return CustomCartsWidget();
                  },
                ),
              ),
            ),
          ),

          CustomContainer(
            isCircle: false,
            backgroundColor: AppColors.white,
            radius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: AppStrings.subTotal, fontSize: 16.sp),
                      CustomText(text: AppStrings.dollarPrice, fontSize: 16.sp),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: AppStrings.delivery, fontSize: 16.sp),
                      CustomText(text: AppStrings.dollarPrice, fontSize: 16.sp),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Divider(color: AppColors.grey, thickness: 1.h),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: AppStrings.total, fontSize: 16.sp),
                      CustomText(text: AppStrings.dollarPrice, fontSize: 16.sp),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print("button is clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: CustomText(
                        text: AppStrings.checkOut,
                        fontSize: 16.sp,
                        fontColor: AppColors.white,
                      ),
                    ),
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
