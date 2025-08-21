import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartsPageController extends GetxController{
  final ScrollController scrollController = ScrollController();
  RxInt items = 10.obs ;

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}