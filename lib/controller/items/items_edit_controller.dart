import 'dart:io';
import 'package:admin_app/controller/items/items_view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/functions/upload_file.dart';
import 'package:admin_app/data/datasource/remote/catagories/view_data.dart';
import 'package:admin_app/data/datasource/remote/items/items_data.dart';
import 'package:admin_app/data/model/catagories_model.dart';
import 'package:admin_app/data/model/items_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  List<SelectedListItem> dropDownList = [];
  List<SelectedListItem> itemActiveList = [
    SelectedListItem(name: 'Acive', value: '1'),
    SelectedListItem(name: 'Hide', value: '0')
  ];
  TextEditingController? itemsActiveController;
  TextEditingController? itemsImageName;
  TextEditingController? itemsName;
  TextEditingController? itemsNameAr;
  TextEditingController? itemsNameku;

  TextEditingController? itemsDesc;
  TextEditingController? itemsDescAr;
  TextEditingController? itemsDescKu;
  TextEditingController? itemsPrice;
  TextEditingController? itemsCount;
  TextEditingController? itemsDiscount;
  String? itemsImage;
  TextEditingController? dropDownName;
  TextEditingController? dropDownID;
  TextEditingController? catName;
  TextEditingController? catID;
  ItemsData itemsData = ItemsData(Get.find());
  ItemsModel? itemsModel;
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery(false);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data = {
        'id': itemsModel!.itemsId!.toString(),
        'imageOld': itemsModel!.itemsImage!,
        'name': itemsName!.text,
        'nameAr': itemsNameAr!.text,
        'nameKu': itemsNameku!.text,
        'desc': itemsDesc!.text,
        'active': itemsActiveController!.text,
        'descAr': itemsDescAr!.text,
        'descKu': itemsDescKu!.text,
        'count': itemsCount!.text.toString(),
        'price': itemsPrice!.text.toString(),
        'discount': itemsDiscount!.text.toString(),
        'catId': catID!.text,
        'datenow': DateTime.now().toString()
      };
      var response = await itemsData.updateData(data);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        data.clear();
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsView);
          ItemsViewController itemsViewController = Get.find();
          itemsViewController.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  getCatData() async {
    CatagoriesData catagoriesData = CatagoriesData(Get.find());
    List<CatagoriesModel> data = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await catagoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
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

  @override
  void onInit() {
    getCatData();
    itemsModel = Get.arguments['itemsModel'];
    itemsName = TextEditingController();
    itemsNameAr = TextEditingController();
    itemsNameku = TextEditingController();
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
    itemsActiveController = TextEditingController();
    //! Save Data To controller
    itemsImage = itemsModel!.itemsImage!;
    itemsName!.text = itemsModel!.itemsName!;
    itemsNameAr!.text = itemsModel!.itemsNameAr!;
    itemsNameku!.text = itemsModel!.itemsNameKu!;
    itemsDesc!.text = itemsModel!.itemsDesc!;
    itemsDescAr!.text = itemsModel!.itemsDescAr!;
    itemsDescKu!.text = itemsModel!.itemsDescKu!;
    itemsCount!.text = itemsModel!.itemsCount!.toString();
    itemsPrice!.text = itemsModel!.itemsPrice!.toString();
    itemsDiscount!.text = itemsModel!.itemsDiscount!.toString();
    // dropDownName!.text = itemsModel!.itemsNameAr!;
    catID!.text = itemsModel!.catagoriesId!.toString();
    catName!.text = itemsModel!.catagoriesName!;
    itemsActiveController!.text =
        itemsModel!.itemsActive! == 0 ? 'Hide' : "Active";
    super.onInit();
  }
}
