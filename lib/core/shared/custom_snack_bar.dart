import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(String title, String content, [bool? longDelay]) {
  return Get.snackbar(
      icon: const Icon(
        Icons.check,
        color: secondColor,
      ),
      backgroundColor: fourthColor,
      colorText: secondColor,
      snackStyle: SnackStyle.FLOATING,
      borderColor: secondColor,
      borderWidth: 1,
      duration: longDelay == true
          ? const Duration(milliseconds: 3000)
          : const Duration(milliseconds: 500),
      title.tr,
      content.tr);
}
