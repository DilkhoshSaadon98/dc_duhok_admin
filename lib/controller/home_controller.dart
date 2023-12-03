import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/home_data.dart';
import 'package:admin_app/data/model/home_model.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  HomeModel? homeModelData;
  List<dynamic>? valuesList;
  logout() {
    // String userid = myServices.sharedPreferences.getString("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      valuesList = [];

      response.forEach((key, value) {
        valuesList!.add(value);
      });
      homeModelData = HomeModel.fromJson(response);
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List<Color> cardColor = [
    Colors.red.withOpacity(.4),
    Colors.green.withOpacity(.4),
    Colors.blue.withOpacity(.4),
    Colors.yellow.withOpacity(.4),
    Colors.cyan.withOpacity(.4),
    Colors.orange.withOpacity(.4),
  ];
  List<String> imageAssets = [
    AppImageAsset.usersSvg,
    AppImageAsset.categoriesSvg,
    AppImageAsset.notificationsSvg,
    AppImageAsset.itemsSvg,
    AppImageAsset.ordersSvg,
    AppImageAsset.messagesSvg,
    // AppImageAsset.reportsSvg,
  ];
  List<String> titleData = [
    'Users',
    'Catagories',
    'Notifications',
    'Items',
    'Orders',
    'Send Notifi.'
    //  'Reports'
  ];

  List<void Function()> voidData = [
    () {
      Get.toNamed(AppRoute.usersView);
    },
    () {
      Get.toNamed(AppRoute.catagoriesView);
    },
    () {
      Get.toNamed(AppRoute.notificationView);
    },
    () {
      Get.toNamed(AppRoute.itemsView);
    },
    () {
      Get.toNamed(AppRoute.ordersHome);
    },
    () {
      Get.toNamed(AppRoute.sendNotificationView);
    },
  ];
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
