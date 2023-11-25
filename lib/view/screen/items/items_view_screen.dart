import 'package:admin_app/controller/items/items_view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      appBar: customAppBarTitle('Items', true),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.itemsAdd);
          },
          label: const Icon(
            Icons.add,
            color: secondColor,
          )),
      body: GetBuilder<ItemsViewController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () {
                return controller.goBack();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width > 400 ? 5 : 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: .8),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          customDifaultDialog('Hint', 'Sure to Remove Items ?',
                              () {
                            controller.deleteItems(
                                controller.data[index].itemsId.toString(),
                                controller.data[index].itemsImage.toString());
                            Get.back();
                          });
                        },
                        onTap: () {
                          controller.goUpdate(controller.data[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryColor, width: .5),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: .5,
                                offset: Offset.fromDirection(
                                    BorderSide.strokeAlignOutside),
                                blurRadius: 1,
                                color: primaryColor,
                              )
                            ],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.network(
                                    height: Get.height * .3,
                                    "${AppLink.imagestItems}/${controller.data[index].itemsImage}"),
                                Flexible(
                                  child: Text(
                                    controller.data[index].itemsName!,
                                    style: titleStyle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.data[index].catagoriesName!,
                                      style: bodyStyle,
                                    ),
                                    Text(
                                      controller.data[index].itemsPricedisount!
                                          .toString(),
                                      style: numberStyle.copyWith(
                                          color: secondColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'In Stock'.toString(),
                                      style: bodyStyle,
                                    ),
                                    Text(
                                      controller.data[index].itemsCount!
                                          .toString(),
                                      style: bodyStyle,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      );
                    }),
              ),
            ));
      }),
    );
  }
}
