import 'package:admin_app/controller/orders/pending_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/shared/custom_card_style.dart';
import 'package:admin_app/data/model/orders_model.dart';
import 'package:admin_app/view/screen/orders/components/orders_bottom_row.dart';
import 'package:admin_app/view/screen/orders/components/single_row_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;

  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: customCardStyle(Colors.white, primaryColor, primaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Order NO : #${listdata.ordersId}", style: titleStyle),
                const Spacer(),
                // Text(listdata.ordersDatetime!)
                Text(
                  Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  style: titleStyle.copyWith(color: AppColor.secondColor),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: AppColor.primaryColor,
            ),
            //! Display Order Type  :
            SingleRowOrdersView(
              isNumber: false,
              title: "Order Type : ",
              data:
                  " ${controller.printOrderType(listdata.ordersType!.toString())}",
            ),
            //! Display Price :
            SingleRowOrdersView(
              isNumber: true,
              title: "Order Price : ",
              data: '${listdata.ordersPrice} IQ',
            ),
            //! Display Delivery Price :
            SingleRowOrdersView(
                isNumber: true,
                title: "Delivery Price : ",
                data: "${listdata.ordersPricedelivery} IQ"),
            //! Display Payment Method :
            GetBuilder<OrdersPendingController>(builder: (controller) {
              return SingleRowOrdersView(
                  isNumber: false,
                  title: "Payment Method : ",
                  data: controller.printPaymentMethod(
                      listdata.ordersPaymentmethod.toString()));
            }),
            //! Display Order Status :
            GetBuilder<OrdersPendingController>(builder: (controller) {
              return SingleRowOrdersView(
                  isNumber: false,
                  title: "Order Status : ",
                  data: controller
                      .printOrderStatus(listdata.ordersStatus.toString()));
            }),
            const Divider(
              thickness: 1,
              color: AppColor.primaryColor,
            ),
            //! Bottom Bar Row :
            CustomTotalPriceRow(
              isDone: listdata.rating == 'none' && listdata.ordersStatus == 4
                  ? true
                  : false,
              listdata: listdata,
              onPressedAccept: () {
                controller.approveOrders(listdata.ordersUsersid!.toString(),
                    listdata.ordersId!.toString());
              },
              onPressedProp: () {
                Get.toNamed(AppRoute.ordersdetails,
                    arguments: {"ordersmodel": listdata});
              },
            ),
          ],
        ));
  }
}
