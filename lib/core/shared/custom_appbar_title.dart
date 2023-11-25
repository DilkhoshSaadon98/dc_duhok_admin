import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBarTitle(String title,
    [bool? isSubScreen, bool? displayBadges]) {
  return AppBar(
   
    leading: isSubScreen == true
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: secondColor,
            ))
        : Container(),
    centerTitle: false,
    backgroundColor: primaryColor,
    elevation: 0,
    title: Text(
      title,
      style: titleStyle.copyWith(color: secondColor, fontSize: 20),
    ),
  );
}
