import 'package:admin_app/controller/notification_controller.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/shared/custom_card_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: customAppBarTitle("Notifications", true),
      body: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListView(children: [
                    ...List.generate(controller.data.length, (index) {
                      return InkWell(
                        onTap: () {
                          controller.goToDetails(
                              controller.data[index].notificationTitle!,
                              controller.data[index].notificationMessage!,
                              controller.data[index].notificationDatetime!,
                              controller.data[index].usersName!);
                        },
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 5),
                          decoration: customCardStyle(white, primaryColor),
                          child: Stack(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.only(
                                    top: 10,
                                    // bottom: 10,
                                    left: 15,
                                    right: 30),
                                title: Text(controller.data[index].usersName!,
                                    style: titleStyle),
                                subtitle: Text(
                                    controller.data[index].notificationTitle!,
                                    style: bodyStyle),
                              ),
                              Positioned(
                                  right: 15,
                                  top: 5,
                                  child: SizedBox(
                                    height: 90,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Jiffy(
                                                  controller.data[index]
                                                      .notificationDatetime,
                                                  "yyyy-MM-dd")
                                              .fromNow()
                                              .toString()
                                              .capitalize!,
                                          style: numberStyle.copyWith(
                                              color: secondColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       // controller.deleteNotification(
                                        //       //     controller.data[index]
                                        //       //         ['notification_id']);
                                        //     },
                                        //     icon: const Icon(
                                        //       Icons.remove_circle_outline,
                                        //       color: Colors.red,
                                        //     ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    })
                  ])))),
    );
  }
}
