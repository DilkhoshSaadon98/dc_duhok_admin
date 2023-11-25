class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsNameKu;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsDescKu;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  int? itemsCat;
  String? itemsDate;
  int? catagoriesId;
  String? catagoriesName;
  String? catagoriesNameAr;
  String? catagoriesImage;
  String? catagoriesDatetime;
  int? favorite;
  double? itemsPricedisount;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsNameKu,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsDescKu,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCat,
      this.itemsDate,
      this.catagoriesId,
      this.catagoriesName,
      this.catagoriesNameAr,
      this.catagoriesImage,
      this.catagoriesDatetime,
      this.favorite,
      this.itemsPricedisount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsNameKu = json['items_name_ku'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescKu = json['items_desc_ku'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = double.parse(json['items_price'].toString());
    itemsDiscount = json['items_discount'];
    itemsCat = json['items_cat'];
    itemsDate = json['items_date'];
    catagoriesId = json['catagories_id'];
    catagoriesName = json['catagories_name'];
    catagoriesNameAr = json['catagories_name_ar'];
    catagoriesImage = json['catagories_image'];
    catagoriesDatetime = json['catagories_datetime'];
    favorite = json['favorite'];
    itemsPricedisount = double.parse(json['items_price'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_ku'] = itemsNameKu;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_ku'] = itemsDescKu;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_cat'] = itemsCat;
    data['items_date'] = itemsDate;
    data['catagories_id'] = catagoriesId;
    data['catagories_name'] = catagoriesName;
    data['catagories_name_ar'] = catagoriesNameAr;
    data['catagories_image'] = catagoriesImage;
    data['catagories_datetime'] = catagoriesDatetime;
    data['favorite'] = favorite;
    data['items_pricedisount'] = itemsPricedisount;
    return data;
  }
}