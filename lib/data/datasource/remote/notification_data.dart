
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.notificationView, {});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteNotification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
