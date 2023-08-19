import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/constant/styles_app.dart';

mixin Helper {
  void myBottomSheet({required List<Widget> children}) {
    Get.bottomSheet(
        isScrollControlled: true,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: children,
              ),
            ),
          ],
        ));
  }

  void showMyDiloag(
      {required String text, Color? backgroundColor, Function()? onPressed}) {
    Get.defaultDialog(
      backgroundColor: AppColors.whiteColor,
      radius: 8,
      title: '',
      titlePadding: EdgeInsets.zero,
      content: Text(
        text,
        style: AppStyles().font18(),
      ),
      titleStyle: AppStyles().font18(),
      // confirm: PrimaryButton(
      //   onPressed: onPressed,
      //   // size: Size(Get.width * 0.3, 34),
      //   width: Get.width * 0.3,
      //   height: 40,
      //   backgroundColor: AppColors.redColor,
      //   textButton: 'Yes'.tr,
      //   radius: 4,
      //   borderColor: Colors.transparent,

      //   textStyle: AppStyles().cairoFont16(
      //     color: AppColors.whiteColor,
      //   ),
      // ),
      // cancel: PrimaryButton(
      //   textButton: 'Cancel'.tr,

      //   width: Get.width * 0.3,
      //   borderColor: Colors.transparent,
      //   height: 40,
      //   // size: Size(Get.width * 0.3, 34),
      //   backgroundColor: Color(0xFFB8BAC3),
      //   radius: 4,
      //   textStyle: AppStyles().cairoFont16(
      //     color: AppColors.whiteColor,
      //   ),
      //   onPressed: () {
      //     Get.back();
      //   },
      // ),
    );
  }

  // void myDialog({required Function()? onPressedConfirm}) {
  //   Get.defaultDialog(
  //       contentPadding: EdgeInsets.only(bottom: 20),
  //       content: const SizedBox(width: 1),
  //       titlePadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 31),
  //       title: 'Do you want to cancel the order'.tr,
  //       titleStyle: AppStyles().cairoFont18(),
  //       confirm: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           PrimaryButton(
  //             textStyle:
  //                 AppStyles().cairoFont16(color: AppColors.whiteSubColor),
  //             width: 115,
  //             height: 34,
  //             onPressed: onPressedConfirm,
  //             textButton: 'Yes'.tr,
  //             radius: 4,
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.shade300.withOpacity(0.3),
  //                   spreadRadius: 1.5,
  //                   blurRadius: 3,
  //                   offset: const Offset(0, 3),
  //                 ),
  //               ],
  //             ),
  //             child: PrimaryButton(
  //               height: 34,
  //               radius: 4,
  //               textStyle:
  //                   AppStyles().cairoFont16(color: AppColors.whiteSubColor),
  //               borderColor: const Color(0xFFB8BAC3),
  //               width: 115,
  //               onPressed: () {
  //                 Get.back();
  //               },
  //               backgroundColor: const Color(0xFFB8BAC3),
  //               textButton: 'Cancel'.tr,
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  void ShowSnackBar(
    BuildContext context, {
    required String title,
    bool isError = false,
  }) {
    Get.snackbar(title, '',
        titleText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isError ?  Icons.verified_outlined: Icons.do_disturb,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: Text(
                title,
                overflow: TextOverflow.fade,
                style: AppStyles().font16(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
        messageText: const SizedBox(),
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: isError ? AppColors.greenColor : AppColors.redColor,
        borderRadius: 0,
        margin: const EdgeInsets.all(0),
        isDismissible: false);
  }
}
