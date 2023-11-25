import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/data/datasource/remote/users_data.dart';
import 'package:admin_app/data/model/users_model.dart';
import 'package:get/get.dart';

class UsersViewController extends GetxController {
  UsersData usersData = UsersData(Get.find());

  List<UsersModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteUsers(String id) {
    usersData.deleteData(id);
    getData();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  goBack() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}
