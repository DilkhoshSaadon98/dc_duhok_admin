import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonGlobal extends StatelessWidget {
  final String text1;
  final int? text2;
  final IconData? iconData;
  final bool? showIcon;
  final void Function()? onPressed;
  const CustomButtonGlobal(
      {Key? key,
      required this.text1,
      this.onPressed,
      this.text2,
      this.iconData,
      this.showIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(constRadius)),
        onPressed: onPressed,
        color: fourthColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1, style: titleStyle.copyWith(color: secondColor)),
            const SizedBox(
              width: 10,
            ),
            text2 != null
                ? Text('( {formattingNumbers(text2!)} )',
                    style: numberStyle.copyWith(color: secondColor))
                : Container(),
            const SizedBox(
              width: 10,
            ),
            showIcon == true
                ? Icon(
                    iconData,
                    color: secondColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
