// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissionNotification() async {
  // FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
}

fcmconfig() {
  
  // FirebaseMessaging.onMessage.listen((message) {
  //   FlutterRingtonePlayer.playNotification();
  //   Get.snackbar(message.notification!.title!, message.notification!.body!);
  //   refreshPageNotification(message.data);
  // });
}

refreshPageNotification(data) {

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
  //  OrdersPendingController controller = Get.find();
  //  controller.refrehOrder();
  }
}


// Firebase + stream 
// Socket io 
// Notification refresh 