import 'package:admin_app/controller/catagories/Edit_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custom_appbar_title.dart';
import 'package:admin_app/core/shared/custrom_buuton_global.dart';
import 'package:admin_app/core/shared/cutom_text_field_global.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CatagoriesEdit extends StatelessWidget {
  const CatagoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CatagoriesEditController controller = Get.put(CatagoriesEditController());
    return Scaffold(
      appBar: customAppBarTitle('Edit Catagories', true),
      bottomNavigationBar: CustomButtomGlobal(
        text: 'Save Changes',
        onPressed: () {
          controller.editData();
        },
      ),
      body: GetBuilder<CatagoriesEditController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 75,
                              foregroundColor: primaryColor,
                              child: controller.file != null
                                  ? Image.file(
                                      controller.file!,
                                      width: 100,
                                      height: 100,
                                    )
                                  : SvgPicture.network(
                                      "${AppLink.imagestCategories}/${controller.catagoriesModel!.catagoriesImage!}",
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
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormGlobal(
                          hinttext: '',
                          labeltext: 'Categories Name (en)',
                          iconData: Icons.category_outlined,
                          mycontroller: controller.catagoriesName,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      CustomTextFormGlobal(
                          hinttext: '',
                          labeltext: 'Categories Name (ar)',
                          iconData: Icons.category_outlined,
                          mycontroller: controller.catagoriesNameAr,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      // CustomButtomGlobal(
                      //   text: 'Upload Image',
                      //   onPressed: () {
                      //     controller.choseFile();
                      //   },
                      // ),
                      // controller.file != null
                      //     ? Image.file(controller.file!)
                      //     : Container(),
                      // const Spacer(),
                    ],
                  ),
                )));
      }),
    );
  }
}
