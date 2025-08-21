import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class WeeklyPlanController extends GetxController{

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final RxList<int> mealItems =   <int>[1].obs;


  final RxString _day = 'Wednesday'.obs;
  final RxString _month = '12 Jun'.obs;
  final RxString _year = '2025'.obs;

  RxString get day => _day;
  RxString get month => _month;
  RxString get year => _year;

  final selectedIndex = 0.obs;
  final dateList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    generateDates();
  }

  void generateDates() {
    dateList.clear();
    DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime date = now.add(Duration(days: i));
      dateList.add({
        'day': DateFormat('E').format(date),
        'date': DateFormat('d').format(date),
      });
    }
  }

  void selectDate(int index) {
    selectedIndex.value = index;
    DateTime selectedDate = DateTime.now().add(Duration(days: index));
    _day.value = DateFormat('EEEE').format(selectedDate);
    _month.value = DateFormat('d MMM').format(selectedDate);
    _year.value = DateFormat('y').format(selectedDate);
  }

  void addMeal() {
    var newMeal = mealItems.length + 1;
    mealItems.add(newMeal);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }




}
