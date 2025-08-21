import 'package:get/get.dart';

import '../../carts/controllers/carts_page_controller.dart';
import '../../home/controllers/home_page_controller.dart';
import '../../list/controllers/list_page_controller.dart';
import '../../profile/controllers/profile_page_controller.dart';
import '../controller/dashboard_controller.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => ListPageController());
    Get.lazyPut(() => CartsPageController());
    Get.lazyPut(() => ProfilePageController());
  }
}
