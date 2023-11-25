class NotificationModel {
  String? usersName;
  String? notificationTitle;
  String? notificationMessage;
  String? notificationDatetime;

  NotificationModel({
    this.usersName,
    this.notificationTitle,
    this.notificationMessage,
    this.notificationDatetime,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    usersName = json['users_name'];
    notificationTitle = json['notification_title'];
    notificationMessage = json['notification_body'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_name'] = this.usersName;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationMessage;
    data['notification_datetime'] = this.notificationDatetime;
    return data;
  }
}
