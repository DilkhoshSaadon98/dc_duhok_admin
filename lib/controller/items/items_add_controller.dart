import 'dart:io';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/functions/upload_file.dart';
import 'package:admin_app/data/datasource/remote/catagories/view_data.dart';
import 'package:admin_app/data/datasource/remote/items/items_data.dart';
import 'package:admin_app/data/model/catagories_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  List<SelectedListItem> dropDownList = [];
  TextEditingController? itemsImageName;
  TextEditingController? itemsName;
  TextEditingController? itemsNameAr;
  TextEditingController? itemsNameKu;

  TextEditingController? itemsDesc;
  TextEditingController? itemsDescAr;
  TextEditingController? itemsDescKu;
  TextEditingController? itemsPrice;
  TextEditingController? itemsCount;
  TextEditingController? itemsDiscount;
  TextEditingController? dropDownName;
  TextEditingController? dropDownID;
  TextEditingController? catName;
  TextEditingController? catID;
  String? catId;

  ItemsData itemsData = ItemsData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery(false);
    update();
  }

  getCatData() async {
    CatagoriesData catagoriesData = CatagoriesData(Get.find());
    List<CatagoriesModel> data = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await catagoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CatagoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownList.add(SelectedListItem(
              name: data[i].catagoriesName!,
              value: data[i].catagoriesId!.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      // if (file != null) {
      //   Get.snackbar('Warning', 'Select Image');
      // } else {
        
      // }
      statusRequest = StatusRequest.loading;
        Map data = {
          'name': itemsName!.text,
          'nameAr': itemsNameAr!.text,
          'nameKu': itemsNameKu!.text,
          'desc': itemsDesc!.text,
          'descAr': itemsDescAr!.text,
          'descKu': itemsDescKu!.text,
          'count': itemsCount!.text,
          'price': itemsPrice!.text,
          'discount': itemsDiscount!.text,
          'catId': catID!.text,
          'datenow': DateTime.now().toString(),
          'imagename': itemsImageName!.text,
        };
        var response = await itemsData.addData(data, file!);

        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          data.clear();
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.itemsView);
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
    getCatData();
    itemsName = TextEditingController();
    itemsNameAr = TextEditingController();
    itemsNameKu = TextEditingController();
    itemsDesc = TextEditingController();
    itemsDescAr = TextEditingController();
    itemsDescKu = TextEditingController();
    itemsCount = TextEditingController();
    itemsPrice = TextEditingController();
    itemsDiscount = TextEditingController();
    dropDownName = TextEditingController();
    dropDownID = TextEditingController();
    catID = TextEditingController();
    catName = TextEditingController();
    itemsImageName = TextEditingController();
    super.onInit();
  }
}
