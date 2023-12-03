
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class SendNotificationData {
  Crud crud;
  SendNotificationData(this.crud);
  sendNotification() async {
    var response = await crud.postData(AppLink.sendNotification, {});
    return response.fold((l) => l, (r) => r);
  }
}
