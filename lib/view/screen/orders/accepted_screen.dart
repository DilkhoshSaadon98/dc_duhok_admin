import 'package:admin_app/controller/orders/accepted_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/view/screen/orders/components/orders_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
        appBar: customAppBarTitle('Accepted Orders', true),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GetBuilder<OrdersAcceptedController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersList(listdata: controller.data[index])),
                  )))),
        ));
  }
}
