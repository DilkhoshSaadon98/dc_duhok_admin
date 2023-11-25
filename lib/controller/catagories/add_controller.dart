import 'dart:io';

import 'package:admin_app/controller/catagories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/functions/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/catagories/view_data.dart';

class CatagoriesAddController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? catagoriesName;
  TextEditingController? catagoriesNameAr;

  CatagoriesData catagoriesData = CatagoriesData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none;

  File? file ;
  choseFile() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar('Warning', 'Select Image');
      }else{
  statusRequest = StatusRequest.loading;
      Map data = {
        'name': catagoriesName!.text,
        'nameAr': catagoriesNameAr!.text,
      };
      var response = await catagoriesData.addData(data, file!);

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
  }

  @override
  void onInit() {
    catagoriesName = TextEditingController();
    catagoriesNameAr = TextEditingController();
    super.onInit();
  }
}
