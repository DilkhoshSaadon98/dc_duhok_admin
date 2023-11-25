import 'package:admin_app/controller/users_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/data/model/users_model.dart';
import 'package:admin_app/view/screen/users/components/single_row_orders_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class UsersCardView extends GetView<UsersViewController> {
  final UsersModel listdata;

  const UsersCardView({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor, width: .5),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
            blurRadius: 1,
            color: primaryColor,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("User ${(listdata.usersId!)}",
                  style: titleStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  customDifaultDialog('Hint', 'Sure to Remove Users ?', () {
                    controller.deleteUsers(listdata.usersId.toString());
                    Get.back();
                  });
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: primaryColor,
          ),
          SigleRowUsersItems(
              title: "User First Name : ", data: listdata.firstName!),
          SigleRowUsersItems(
              title: "User Last Name : ", data: listdata.lastName!),
          SigleRowUsersItems(title: "User Name : ", data: listdata.usersName!),
          SigleRowUsersItems(
              title: "User E-mail: ", data: listdata.usersEmail!),
          SigleRowUsersItems(
              title: "User Phone : ", data: listdata.usersPhone!),
          SigleRowUsersItems(
              title: "User Create : ", data: listdata.usersCreate!),
        ],
      ),
    );
  }
}
