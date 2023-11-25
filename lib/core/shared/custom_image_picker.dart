import 'dart:io';

import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomImagePicker extends StatelessWidget {
  final bool? isSvg;
  final File? file;
  final String? path;
  final void Function()? onPressed;
  const CustomImagePicker(
      {super.key,
      this.isSvg,
      required this.file,
      required this.path,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: primaryColor)),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.transparent,
            child: isSvg == true
                ? file != null
                    ? SvgPicture.file(
                        file!,
                        width: 125,
                        height: 125,
                      )
                    : SvgPicture.network(
                        "${AppLink.imagestItems}/$path",
                        width: 125,
                        height: 125,
                      )
                : file != null
                    ? Image.file(
                        file!,
                        width: 125,
                        height: 125,
                      )
                    : Image.network(
                        "${AppLink.imagestItems}/$path",
                        width: 125,
                        height: 125,
                      ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add_a_photo,
              color: primaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
