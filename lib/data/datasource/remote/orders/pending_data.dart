import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String userId, String orderId) async {
    var response = await crud.postData(AppLink.approveOrders,
        {'usersid': userId, 'ordersid': orderId});
    return response.fold((l) => l, (r) => r);
  }
}
