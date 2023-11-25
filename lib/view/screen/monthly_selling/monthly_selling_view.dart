import 'package:admin_app/controller/monthly_selling_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/shared/custom_card_style.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthlySellingView extends StatelessWidget {
  const MonthlySellingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlySellingController());
    return Scaffold(
        appBar: customAppBarTitle('Monthly Selling', true),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: titleStyle.copyWith(fontSize: 20),
                    ),
                    Text(
                      DateFormat.yMMMd().format(DateTime.now()),
                      style: titleStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: primaryColor,
                thickness: 1,
              ),
              Expanded(
                flex: 2,
                child:
                    GetBuilder<MonthlySellingController>(builder: (controller) {
                  return DatePicker(
                    height: 120,
                    DateTime(DateTime.now().year, 8),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: primaryColor,
                    selectedTextColor: secondColor,
                    onDateChange: (date) {
                      controller.getData(
                        date.day.toString(),
                        date.month.toString(),
                        date.year.toString(),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 7,
                child:
                    GetBuilder<MonthlySellingController>(builder: (controller) {
                  return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1, vertical: 8),
                                    margin: const EdgeInsets.only(top: 20),
                                    decoration: customCardStyle(primaryColor, secondColor),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: secondColor,
                                        child: Text(
                                          (index + 1).toString(),
                                          style: numberStyle,
                                        ),
                                      ),
                                      title: Text(
                                        controller.data[index].itemsName!,
                                        style: titleStyle.copyWith(
                                            color: secondColor),
                                      ),
                                      subtitle: Text(
                                        '${controller.data[index].totalSales!} IQ',
                                        style: numberStyle.copyWith(
                                            color: secondColor),
                                      ),
                                      trailing: Text(
                                        "# ${controller.data[index].totalQuantity!}",
                                        style: numberStyle.copyWith(
                                            color: secondColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                }),
              ),
            ],
          ),
        ));
  }
}
