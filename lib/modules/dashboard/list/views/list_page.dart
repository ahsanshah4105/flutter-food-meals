import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/list_card_widget.dart';
import '../controllers/list_page_controller.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ListPageController _controller = Get.find<ListPageController>();

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
          SizedBox(height: 31.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppStrings.shoppingLists,
                fontSize: 16.sp,
                fontFamily: AppFonts.nunitoBold,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Obx(() {
              if (_controller.cardIds.isEmpty) {
                return Center(
                  child: CustomText(
                    text: AppStrings.noItemsFound,
                    fontSize: 16,
                    fontColor: AppColors.grey,
                  ),
                );
              }
              return AnimatedList(
                key: _controller.listKey,
                initialItemCount: _controller.cardIds.length,
                controller: _controller.scrollController,
                itemBuilder: (context, index, animation) {
                  final number = _controller.cardIds[index];
                  return SizeTransition(
                    sizeFactor: animation,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ListCardWidget(
                        number: number,
                        onDelete: () {
                          _controller.removeCard(index);
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
