import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class HomePageController extends GetxController {
  RxInt items = 10.obs;
  final ScrollController scrollController = ScrollController();



  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

