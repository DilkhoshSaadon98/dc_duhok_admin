import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomGlobal extends StatelessWidget {
  final String text;
  final double? width;
  final void Function()? onPressed;
  const CustomButtomGlobal(
      {Key? key, required this.text, this.onPressed, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text, style: titleStyle.copyWith(color: AppColor.white)),
      ),
    );
  }
}
