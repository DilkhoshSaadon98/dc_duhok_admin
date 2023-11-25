import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class AcceptedOrdersData {
  Crud crud;
  AcceptedOrdersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String userid, String orderId, String ordersType) async {
    var response = await crud.postData(AppLink.prepareOrders,
        {"usersid": userid, "ordersid": orderId, 'orderstype': ordersType});
    return response.fold((l) => l, (r) => r);
  }
}
