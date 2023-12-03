import 'package:admin_app/data/datasource/remote/send_notification_data.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

class SendNOtificationController extends GetxController {
  MyServices myServices = Get.find();
  SendNotificationData sendNotificationData = SendNotificationData(Get.find());
  sendNotifi() {
    sendNotificationData.sendNotification();
  }
  
}
