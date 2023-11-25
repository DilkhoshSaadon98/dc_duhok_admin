import 'package:admin_app/controller/items/items_add_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/shared/custom_drop_down_search.dart';
import 'package:admin_app/core/shared/custom_sized_box.dart';
import 'package:admin_app/core/shared/custrom_buuton_global.dart';
import 'package:admin_app/core/shared/cutom_text_field_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
      appBar: customAppBarTitle('Add Items', true),
      bottomNavigationBar: CustomButtomGlobal(
        text: 'Add Items',
        onPressed: () {
          controller.addData();
        },
      ),
      body: GetBuilder<ItemsAddController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: SingleChildScrollView(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1, color: primaryColor)),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.transparent,
                                child: controller.file != null
                                    ? Image.file(
                                        controller.file!,
                                        width: 75,
                                        height: 75,
                                      )
                                    : SvgPicture.asset(
                                        AppImageAsset.itemsSvg,
                                        width: 75,
                                        height: 75,
                                      ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.choseFile();
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: primaryColor,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Image Name',
                            iconData: Icons.image,
                            mycontroller: controller.itemsImageName,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'English Name',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsName,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Arabic Name',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsNameAr,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Kurdish Name',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsNameKu,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'English Description',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDesc,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'Arabic Description',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDescAr,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'Kurdish Description',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDescKu,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Count',
                            iconData: Icons.numbers_outlined,
                            mycontroller: controller.itemsCount,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Price in IQ',
                            iconData: Icons.price_change,
                            mycontroller: controller.itemsPrice,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Discount',
                            iconData: Icons.discount,
                            mycontroller: controller.itemsDiscount,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomDropDownSearch(
                            title: 'Choose Catagories',
                            listData: controller.dropDownList,
                            contrllerName: controller.catName!,
                            contrllerId: controller.catID!),
                        customSizedBox(),
                      ],
                    ),
                  )),
            ));
      }),
    );
  }
}
