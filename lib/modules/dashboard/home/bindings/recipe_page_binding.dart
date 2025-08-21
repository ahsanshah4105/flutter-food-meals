import 'package:get/get.dart';

import '../controllers/RecipePageController.dart';
class RecipePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RecipePageController());
  }

}