class MonthlySellingModel {
  int? year;
  int? month;
  int? day;
  int? itemsId;
  String? itemsName;
  int? totalQuantity;
  String? totalSales;

  MonthlySellingModel(
      {this.year,
      this.month,
      this.day,
      this.itemsId,
      this.itemsName,
      this.totalQuantity,
      this.totalSales});

  MonthlySellingModel.fromJson(Map<String, dynamic> json) {
    year = json['YEAR'];
    month = json['month'];
    day = json['DAY'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    totalQuantity = json['total_quantity'];
    totalSales = json['total_sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['total_quantity'] = this.totalQuantity;
    data['total_sales'] = this.totalSales;
    return data;
  }
}