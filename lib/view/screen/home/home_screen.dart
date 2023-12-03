import 'package:admin_app/controller/home_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/shared/custom_sized_box.dart';
import 'package:admin_app/view/screen/home/components/custom_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Welcome, '.tr,
                  style: titleStyle.copyWith(
                      fontSize: 15.sp, color: primaryColor, height: 1),
                ),
                Text(
                  '${'Dilkhosh'.capitalizeFirst}',
                  style: titleStyle.copyWith(
                      fontSize: 15.sp, color: secondColor, height: 1),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: Get.height.h,
              child: GetBuilder<HomeController>(builder: (controller) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width > 500 ? 5 : 2,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 10.h),
                    itemCount: controller.titleData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: controller.voidData[index],
                        child: Container(
                          height: 200,
                          width: 100,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: controller.cardColor[index],
                              borderRadius: BorderRadius.circular(constRadius)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(controller.titleData[index],
                                        style: bodyStyle.copyWith(
                                            color: black, fontSize: 8.sp)),
                                  ),
                                  // Flexible(
                                  //   // child: Text(
                                  //   //   controller.valuesList![index].toString(),
                                  //   //   style: bodyStyle.copyWith(
                                  //   //       color: black, fontSize: 6.sp),
                                  //   // ),
                                  // ),
                                ],
                              ),
                              SvgPicture.asset(
                                controller.imageAssets[index],
                                width: 35.w,
                                height: 35.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
           
          ],
        ),
      ),
    );
  }
}

