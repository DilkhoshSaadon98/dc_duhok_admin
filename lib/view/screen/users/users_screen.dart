import 'package:admin_app/controller/users_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/view/screen/users/components/users_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersViewController());
    return Scaffold(
      appBar: customAppBarTitle('Users', true),
      body: GetBuilder<UsersViewController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () {
                return controller.goBack();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return UsersCardView(
                        listdata: controller.data[index],
                      );
                    }),
              ),
            ));
      }),
    );
  }
}
