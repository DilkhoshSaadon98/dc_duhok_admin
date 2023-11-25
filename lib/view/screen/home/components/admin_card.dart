import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminCardsWidgets extends StatelessWidget {
  final String? title;
  final String imageAssets;
  final void Function()? onTap;
  const AdminCardsWidgets(
      {super.key, this.title, required this.imageAssets, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: primaryColor, width: .5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
                blurRadius: 1,
                color: primaryColor,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imageAssets,
              width: 75,
              height: 75,
            ),
            Text(
              title!,
              style: bodyStyle.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
