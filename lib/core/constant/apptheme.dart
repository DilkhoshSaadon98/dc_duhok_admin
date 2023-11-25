import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

MyServices myServices = Get.find();
// ThemeData themeEnglish = ThemeData(
//   fontFamily: "PlayfairDisplay",
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: AppColor.primaryColor),
//   appBarTheme: AppBarTheme(
//     centerTitle: false,
//     elevation: 0,
//     iconTheme: const IconThemeData(color: AppColor.primaryColor),
//     titleTextStyle:
//         titleStyle.copyWith(color: AppColor.primaryColor, fontSize: 22),
//     backgroundColor: Colors.grey[50],
//   ),
//   textTheme: const TextTheme(
//       displayLarge: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
//       displayMedium: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
//       bodyLarge: TextStyle(
//           height: 2,
//           color: AppColor.grey,
//           fontWeight: FontWeight.bold,
//           fontSize: 14),
//       bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
//   primarySwatch: Colors.blue,
// );

// ThemeData themeArabic = ThemeData(
//   fontFamily: "Cairo",
//   appBarTheme: AppBarTheme(
//     centerTitle: false,
//     elevation: 0,
//     iconTheme: const IconThemeData(color: AppColor.primaryColor),
//     titleTextStyle:
//         titleStyle.copyWith(color: AppColor.primaryColor, fontSize: 25),
//     backgroundColor: AppColor.white,
//   ),
//   textTheme: const TextTheme(
//       displayLarge: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
//       displayMedium: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
//       bodyLarge: TextStyle(
//           height: 2,
//           color: AppColor.grey,
//           fontWeight: FontWeight.bold,
//           fontSize: 14),
//       bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
//   primarySwatch: Colors.blue,
// );
TextStyle get titleStyle {
  return GoogleFonts.barlowCondensed(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
  ));
}

TextStyle get bodyStyle {
  return GoogleFonts.barlowCondensed(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryColor,
  ));
}

TextStyle get numberStyle {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  ));
}

const double constRadius = 10;
