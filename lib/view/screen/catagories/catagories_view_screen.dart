import 'package:admin_app/controller/catagories/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CatagoriesView extends StatelessWidget {
  const CatagoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatagoriesViewController());
    return Scaffold(
      appBar: customAppBarTitle('Catagories', true),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.catagoriesAdd);
          },
          label: const Icon(
            Icons.add,
            color: secondColor,
          )),
      body: GetBuilder<CatagoriesViewController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () {
                return controller.goBack();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width > 500 ? 6 : 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.goUpdate(controller.data[index]);
                        },
                        onLongPress: () {
                          customDifaultDialog(
                              'Hint', 'Sure to Remoce Catagories ?', () {
                            controller.deleteCatagories(
                                controller.data[index].catagoriesId.toString(),
                                controller.data[index].catagoriesImage
                                    .toString());
                            Get.back();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryColor, width: .5),
                            // boxShadow: [
                            //   BoxShadow(
                            //     spreadRadius: 1,
                            //     offset: Offset.fromDirection(
                            //         BorderSide.strokeAlignOutside),
                            //     blurRadius: 1,
                            //     color: primaryColor,
                            //   )
                            // ],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: SvgPicture.network(
                                        width: 75,
                                        color: primaryColor,
                                        fit: BoxFit.contain,
                                        "${AppLink.imagestCategories}/${controller.data[index].catagoriesImage}")),
                                Flexible(
                                  child: Text(
                                    controller.data[index].catagoriesName!,
                                    style: titleStyle,
                                  ),
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
