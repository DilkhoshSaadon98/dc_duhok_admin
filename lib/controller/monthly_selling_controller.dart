import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/data/datasource/remote/monthly_selling_data.dart';
import 'package:admin_app/data/model/monthly_selling_model.dart';
import 'package:get/get.dart';

class MonthlySellingController extends GetxController {
  MonthlySellingData monthlySellingData = MonthlySellingData(Get.find());
  List<MonthlySellingModel> data = [];
  //   List<SelectedListItem> dropDownList = [];
  // List<SelectedListItem> itemActiveList = [
  //   SelectedListItem(name: 'Acive', value: '1'),
  //   SelectedListItem(name: 'Hide', value: '0')
  // ];
  int? day;
  late StatusRequest statusRequest;

  getData(String day, String month, String year) async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await monthlySellingData.getData(day, month, year);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        print(dataList);
        data.addAll(dataList.map((e) => MonthlySellingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    day = DateTime.now().month;
    getData(DateTime.now().day.toString(), DateTime.now().month.toString(),
        DateTime.now().year.toString());
    super.onInit();
  }
}
