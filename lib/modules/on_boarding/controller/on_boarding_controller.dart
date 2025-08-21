import 'dart:async';
import 'package:food/core/utils/app_strings.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_assets.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:flutter/widgets.dart';

class OnboardingController extends GetxController {
  RxDouble currentWidth = 114.w.obs;
  Timer? _widthTimer;
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(pageListener);
  }

  void pageListener() {
    final page = pageController.page;
    if (page == null) return;
    final newIndex = page.round();
    if (currentIndex.value != newIndex) currentIndex.value = newIndex;
  }

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.on_board_home,
      "title": AppStrings.stayOnTopOfMeals,
      "subtitle": AppStrings.quicklyViewAndAccessFavouriteMeals,
    },
    {
      "image": AppAssets.on_board_home,
      "title": AppStrings.plansForTheWeek,
      "subtitle": AppStrings.discoverNutritiousMeals,
    },
    {
      "image": AppAssets.on_board_home,
      "title": AppStrings.yourMealsCartOrganized,
      "subtitle": AppStrings.automaticallyAddIngredients,
    },
    {
      "image": AppAssets.on_board_home,
      "title": AppStrings.neverMissAMeal,
      "subtitle": AppStrings.getDetailedViewOfYourMeals,
    },
  ];
  void updateWidth(int currentIndex, double fullWidth, double compactWidth) {
    final targetWidth =
        (currentIndex == 0 || currentIndex == onboardingData.length)
            ? fullWidth
            : compactWidth;
    animateWidth(targetWidth);
  }

  void animateWidth(double targetWidth, {double step = 10}) {
    _widthTimer?.cancel();
    _widthTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if ((currentWidth.value - targetWidth).abs() <= step) {
        currentWidth.value = targetWidth;
        timer.cancel();
      } else if (currentWidth.value < targetWidth) {
        currentWidth.value += step;
      } else {
        currentWidth.value -= step;
      }
    });
  }

  void updateIndex(int index, double fullWidth, double compactWidth) {
    currentIndex.value = index;
    updateWidth(index, fullWidth, compactWidth);
  }

  // void nextPage() {
  //   if (currentIndex.value < onboardingData.length) {
  //     _pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   } else {
  //     goToDashboard();
  //   }
  // }
  void nextPage() {
    //final lastIndex = onboardingData.length - 1;
    if (currentIndex.value <  onboardingData.length - 1) {
      final target = currentIndex.value + 1;
      pageController.animateToPage(
        target,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goToDashboard();
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  String getStartedOrNext() {
    if(currentIndex.value == onboardingData.length -1){
      return AppStrings.getStarted;
    }else{
      return AppStrings.next;
    }
  }
  void goToDashboard() {
    Get.offAllNamed('/DashBoard');
  }

  @override
  void onClose() {
    pageController.removeListener(pageListener);
    pageController.dispose();
    super.onClose();
  }
}
