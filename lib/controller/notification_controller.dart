import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/notification_data.dart';
import 'package:admin_app/data/model/notifications_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List<NotificationModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  readNotification(String id) async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  // favoriteData.deleteData(favroiteid);
  // data.removeWhere((element) => element.favoriteId == favroiteid);
  // update();
  deleteNotification(int index) async {
    notificationData.deleteData(index.toString());
    getData();
    update();
  }

  goToDetails(String title, String content, String time, String userName) {
    Get.toNamed(AppRoute.notificationViewDetails, arguments: {
      'title': title,
      'content': content,
      'time': time,
      'username': userName,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

class NotificationDetailsController extends GetxController {
  String? title;
  String? content;
  String? time;
  String? username;
  @override
  void onInit() {
    title = Get.arguments['title'];
    content = Get.arguments['content'];
    time = Get.arguments['time'];
    username = Get.arguments['username'];
    super.onInit();
  }
}
