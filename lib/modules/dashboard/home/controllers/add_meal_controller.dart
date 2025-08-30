import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/core/screen_size/size_config.dart';
import 'package:food/core/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../../core/constants/edit_field_type.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/values/app_radius.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddMealController extends GetxController {
  final ScrollController _scrollController = ScrollController();
  void showEditDialog(BuildContext context, EditFieldType fieldType) {
    String title = '';
    List<Widget> inputFields = [];

    switch (fieldType) {
      case EditFieldType.name:
        title = 'Edit Name';
        inputFields = [
          Align(
            alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.name,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.enterName,
            onChanged: (value) {
              print("Name: $value");
            },
          ),
        ];
        break;
      case EditFieldType.phone:
        title = 'Edit Phone';
        inputFields = [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.phone,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.phone,
            onChanged: (value) {
              print("Phone: $value");
            },
          ),
        ];
        break;
      case EditFieldType.email:
        title = 'Edit Email';
        inputFields = [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.emailtxt,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.newEmail,
            onChanged: (value) {
              print("Email: $value");
            },
          ),
        ];
        break;
      case EditFieldType.password:
        title = 'Edit Password';
        inputFields = [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.currentPassword,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.currentPassword,
            onChanged: (value) {
              print("Current Password: $value");
            },
          ),
          SizedBox(height: 12.h),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.newPassword,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.newPassword,
            onChanged: (value) {
              print("New Password: $value");
            },
          ),
          SizedBox(height: 12.h),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: AppStrings.confirmPassword,fontSize: 14.sp,)
          ),
          SizedBox(height: 8.h),
          AppTextField(
            labelText: AppStrings.confirmPassword,
            onChanged: (value) {
              print("Confirm Password: $value");
            },
          ),
        ];
        break;
    }

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        titlePadding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.nunitoBold,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: inputFields,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppRadius.r16,
                    ),
                    border: Border.all(
                      width: 1,
                      color: AppColors.grey,
                    ),
                  ),
                  child: CustomButton(
                      onTap: () => Get.back(),
                      buttonColor: AppColors.white,
                      borderRadius: AppRadius.r16,
                      borderColor: Colors.grey ,
                      trailingIcon: null,
                      buttonChild: CustomText(
                        text: AppStrings.cancel,
                        fontSize: 16.sp,
                      ),
                    ),

                ),
              ),
              SizedBox(width: 9.h),
              Expanded(
                child:CustomButton(
                  onTap: () => Get.back(),
                  buttonColor: AppColors.greenAccent,
                  borderRadius: AppRadius.r16,
                  borderColor: Colors.grey ,
                  trailingIcon: null,
                  buttonChild: CustomText(
                    text: AppStrings.save,
                    fontSize: 16.sp,
                    fontColor: AppColors.white,
                    fontFamily: AppFonts.nunitoSemibold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
