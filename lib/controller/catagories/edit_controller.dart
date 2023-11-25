import 'dart:io';

import 'package:admin_app/controller/catagories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/functions/upload_file.dart';
import 'package:admin_app/data/model/catagories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/catagories/view_data.dart';

class CatagoriesEditController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? catagoriesName;
  TextEditingController? catagoriesNameAr;

  CatagoriesData catagoriesData = CatagoriesData(Get.find());
  CatagoriesModel? catagoriesModel;
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data = {
        'id': catagoriesModel!.catagoriesId.toString(),
        'name': catagoriesName!.text,
        'imageOld': catagoriesModel!.catagoriesImage,
        'nameAr': catagoriesNameAr!.text,
      };
      var response = await catagoriesData.updateData(data);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        data.clear();
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.catagoriesView);
          CatagoriesViewController catagoriesViewController = Get.find();
          catagoriesViewController.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  @override
  void onInit() {
    catagoriesModel = Get.arguments['catagoriesModel'];
    catagoriesName = TextEditingController();
    catagoriesNameAr = TextEditingController();
    catagoriesName!.text = catagoriesModel!.catagoriesName!;
    catagoriesNameAr!.text = catagoriesModel!.catagoriesNamaAr!;
    super.onInit();
  }
}
