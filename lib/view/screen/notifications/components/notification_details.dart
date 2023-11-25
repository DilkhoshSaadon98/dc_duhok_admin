import 'package:admin_app/controller/notification_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationDetailsController());
    return Scaffold(
      appBar: customAppBarTitle('Notification Details', true),
      body: GetBuilder<NotificationDetailsController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(
                      FontAwesomeIcons.k,
                      color: secondColor,
                    )),
                title: Text(
                  'Kurduino Store',
                  style: titleStyle,
                ),
                subtitle: Text(
                  'To ${controller.username}',
                  style: bodyStyle,
                ),
                trailing: Text(
                  Jiffy(controller.time, "yyyy-MM-dd")
                      .yMd
                      .toString()
                      .capitalize!,
                  style: bodyStyle.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
                color: primaryColor,
              ),
              Text(
                controller.title!,
                style: titleStyle.copyWith(
                  
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                controller.content!,
                style: bodyStyle,
              ),
            ],
          ),
        );
      }),
    );
  }
}
