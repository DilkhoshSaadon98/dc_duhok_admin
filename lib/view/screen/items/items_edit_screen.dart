import 'package:admin_app/controller/items/items_edit_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/shared/custom_drop_down_search.dart';
import 'package:admin_app/core/shared/custom_image_picker.dart';
import 'package:admin_app/core/shared/custrom_buuton_global.dart';
import 'package:admin_app/core/shared/cutom_text_field_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
      appBar: customAppBarTitle('Edit Items', true),
      bottomNavigationBar: CustomButtomGlobal(
        text: 'Edit Items',
        onPressed: () {
          controller.editData();
        },
      ),
      body: GetBuilder<ItemsEditController>(builder: (controller) {
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
                        CustomImagePicker(
                            isSvg: false,
                            file: controller.file,
                            path: controller.itemsImage,
                            onPressed: () async {
                              await controller.choseFile();
                            }),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Name (En)',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsName,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Name (Ar)',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsNameAr,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Name (Ku)',
                            iconData: Icons.category_outlined,
                            mycontroller: controller.itemsNameku,
                            valid: (val) {
                              return validInput(val!, 1, 300, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'Items Desc. (En)',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDesc,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'Items Desc. (Ar)',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDescAr,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            isDsc: true,
                            hinttext: '',
                            labeltext: 'Items Desc. (Ku)',
                            iconData: Icons.description_outlined,
                            mycontroller: controller.itemsDescKu,
                            valid: (val) {
                              return validInput(val!, 1, 50000, "");
                            },
                            isNumber: false),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Count',
                            iconData: Icons.numbers_outlined,
                            mycontroller: controller.itemsCount,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Price (IQ)',
                            iconData: Icons.price_change_outlined,
                            mycontroller: controller.itemsPrice,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomTextFormGlobal(
                            hinttext: '',
                            labeltext: 'Items Discount',
                            iconData: Icons.discount_outlined,
                            mycontroller: controller.itemsDiscount,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: true),
                        CustomDropDownSearch(
                            iconData: Icons.visibility_outlined,
                            title: 'Items Acive',
                            listData: controller.itemActiveList,
                            contrllerName: controller.itemsActiveController!,
                            contrllerId: controller.itemsActiveController!),
                        CustomDropDownSearch(
                            iconData: Icons.category_sharp,
                            title: 'Choose Catagories',
                            listData: controller.dropDownList,
                            contrllerName: controller.catName!,
                            contrllerId: controller.catID!),
                        controller.file != null
                            ? Image.file(controller.file!)
                            : Container(),
                      ],
                    ),
                  )),
            ));
      }),
    );
  }
}
