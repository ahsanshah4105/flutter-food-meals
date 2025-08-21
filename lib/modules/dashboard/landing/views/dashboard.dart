import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/widgets/image_viewer.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../controller/dashboard_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final DashBoardController _controller = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: PopScope(
          canPop: _controller.currentIndex.value == 0,
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if (!didPop && _controller.currentIndex.value != 0) {
              _controller.currentIndex.value = 0;
            }
          },
          child: Obx(() => Scaffold(
          body: _controller.pages[_controller.currentIndex.value],
          bottomNavigationBar: SizedBox(
            child: BottomNavigationBar(
              backgroundColor: AppColors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _controller.currentIndex.value,
              onTap: (index) => _controller.currentIndex.value = index,
              selectedItemColor: AppColors.greenAccent,
              selectedLabelStyle: TextStyle(
                fontFamily: AppFonts.nunitoMedium,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: AppColors.greenAccent,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: AppFonts.nunitoMedium,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: AppColors.blendModeColor,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.homeIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.blendModeColor,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.homeIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.greenAccent,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.listIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.blendModeColor,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.listIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.greenAccent,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  label: AppStrings.list,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.cartIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.blendModeColor,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.cartIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.greenAccent,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  label: AppStrings.carts,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.profileIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.blendModeColor,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      SizedBox(height: 17,),
                      ImageViewer(
                        url: AppAssets.profileIcon,
                        width: 18.w,
                        height: 18.h,
                        color: AppColors.greenAccent,
                      ),
                      SizedBox(height: 7.h),
                    ],
                  ),
                  label: AppStrings.profile,
                ),

              ],
            ),
          ),
        ),
      )),
    );
  }
}
