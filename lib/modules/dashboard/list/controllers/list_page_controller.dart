import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/list_card_widget.dart';

class ListPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final RxList<int> cardIds = List.generate(10, (index) => index + 1).obs;

  void removeCard(int index) {
    final removedItem = cardIds[index];
    cardIds.removeAt(index);
    listKey.currentState?.removeItem(
      index,
          (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: ListCardWidget(
          number: removedItem,
          onDelete: () {}, // empty, since item is being removed
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
