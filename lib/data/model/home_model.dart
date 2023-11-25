class HomeModel {
  int? catagories;
  int? items;
  int? users;
  int? orders;
  int? notifications;

  HomeModel(
      {this.catagories,
      this.items,
      this.users,
      this.orders,
      this.notifications});

  HomeModel.fromJson(Map<String, dynamic> json) {
    catagories = json['catagories'];
    items = json['items'];
    users = json['users'];
    orders = json['orders'];
    notifications = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catagories'] = this.catagories;
    data['items'] = this.items;
    data['users'] = this.users;
    data['orders'] = this.orders;
    data['notifications'] = this.notifications;
    return data;
  }
}