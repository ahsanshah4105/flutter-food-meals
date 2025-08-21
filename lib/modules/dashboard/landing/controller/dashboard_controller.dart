import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../carts/views/cart_page.dart';
import '../../home/views/home_page.dart';
import '../../list/views/list_page.dart';
import '../../profile/views/profile_page.dart';

class DashBoardController extends GetxController {

  RxInt currentIndex = 0.obs;

  final List<Widget> _pages = [
    HomePage(),
    ListPage(),
    CartPage(),
    ProfilePage(),
  ];

  List<Widget> get pages {

    return _pages;
  }

  void changeIndex(int index) {
    if (index >= 0 && index < _pages.length) {
      currentIndex.value = index;
    }
  }
}