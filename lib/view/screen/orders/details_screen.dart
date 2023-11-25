// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:admin_app/controller/orders/details_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/shared/custom_card_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: customAppBarTitle('Orders Details', true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: customCardStyle(
                        Colors.white, primaryColor, primaryColor),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Text("Items",
                                  textAlign: TextAlign.center,
                                  style: titleStyle.copyWith(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                  )),
                              Text("QTY",
                                  textAlign: TextAlign.center,
                                  style: titleStyle.copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                  )),
                              Text("Price",
                                  textAlign: TextAlign.center,
                                  style: titleStyle.copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                  )),
                            ]),
                            TableRow(children: [
                              Divider(
                                thickness: 1,
                                color: primaryColor,
                              ),
                              Divider(
                                thickness: 1,
                                color: primaryColor,
                              ),
                              Divider(
                                thickness: 1,
                                color: primaryColor,
                              ),
                            ]),
                            ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                      Text(
                                        "${controller.data[index].itemsName}",
                                        textAlign: TextAlign.center,
                                        style: bodyStyle.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "${controller.data[index].countitems}",
                                        textAlign: TextAlign.center,
                                        style: bodyStyle.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                          "${controller.data[index].itemsprice} IQ",
                                          textAlign: TextAlign.center,
                                          style: numberStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    ]))
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 1,
                          color: primaryColor,
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Price",
                                  textAlign: TextAlign.center,
                                  style: titleStyle),
                              Text(
                                  "${controller.ordersModel.ordersTotalprice} IQ",
                                  textAlign: TextAlign.center,
                                  style: numberStyle.copyWith(
                                      fontSize: 16,
                                      color: secondColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //! If Address Not Selected :
                  if (controller.ordersModel.ordersType == 0)
                    Container(
                      decoration: customCardStyle(primaryColor, secondColor),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: secondColor,
                        ),
                        title: const Text("Shipping Address",
                            style: TextStyle(
                                color: secondColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "${controller.ordersModel.addressCity} - ${controller.ordersModel.addressRegion} - ${controller.ordersModel.addressStreet}",
                          style: bodyStyle.copyWith(color: secondColor),
                        ),
                      ),
                    ),
                  // if (controller.ordersModel.ordersType == 0)
                  //   Card(
                  //     child: Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //       height: 300,
                  //       width: double.infinity,
                  //       child: GoogleMap(
                  //         mapType: MapType.normal,
                  //         markers: controller.markers.toSet(),
                  //         initialCameraPosition: controller.cameraPosition!,
                  //         onMapCreated: (GoogleMapController controllermap) {
                  //           controller.completercontroller!
                  //               .complete(controllermap);
                  //         },
                  //       ),
                  //     ),
                  //   )
                ])))),
      ),
    );
  }
}
