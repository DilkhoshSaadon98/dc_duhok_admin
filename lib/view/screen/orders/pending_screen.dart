import 'package:admin_app/controller/orders/pending_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/view/screen/orders/components/orders_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends GetView<OrdersPendingController> {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        appBar: customAppBarTitle('Pending Orders', true),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) {
                      return CardOrdersList(listdata: controller.data[index]);
                    }),
                  )))),
        ));
  }
}
