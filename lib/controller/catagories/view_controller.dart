import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/data/datasource/remote/catagories/view_data.dart';
import 'package:admin_app/data/model/catagories_model.dart';
import 'package:get/get.dart';

class CatagoriesViewController extends GetxController {
  CatagoriesData catagoriesData = CatagoriesData(Get.find());

  List<CatagoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await catagoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CatagoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteCatagories(String id, String imageName) {
    catagoriesData.deleteData({'id': id, 'imagename': imageName});
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

  goUpdate(CatagoriesModel catagoriesModel) {
    Get.toNamed(AppRoute.catagoriesEdit, arguments: {
      'catagoriesModel' :catagoriesModel
    });
  }
}
