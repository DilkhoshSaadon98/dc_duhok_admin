import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/data/datasource/remote/items/items_data.dart';
import 'package:admin_app/data/model/items_model.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await itemsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItems(String id, String imageName) {
    itemsData.deleteData({'id': id, 'imagename': imageName});
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

  goUpdate(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsEdit, arguments: {'itemsModel': itemsModel});
  }
}
