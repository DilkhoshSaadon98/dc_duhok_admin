
class CatagoriesModel {
  int? catagoriesId;
  String? catagoriesName;
  String? catagoriesNamaAr;
  String? catagoriesImage;
  String? catagoriesDatetime;

  CatagoriesModel(
      {this.catagoriesId,
      this.catagoriesName,
      this.catagoriesNamaAr,
      this.catagoriesImage,
      this.catagoriesDatetime});

  CatagoriesModel.fromJson(Map<String, dynamic> json) {
    catagoriesId = json['catagories_id'];
    catagoriesName = json['catagories_name'];
    catagoriesNamaAr = json['catagories_name_ar'];
    catagoriesImage = json['catagories_image'];
    catagoriesDatetime = json['catagories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['catagories_id'] = catagoriesId;
    data['catagories_name'] = catagoriesName;
    data['catagories_name_ar'] = catagoriesNamaAr;
    data['catagories_image'] = catagoriesImage;
    data['catagories_datetime'] = catagoriesDatetime;
    return data;
  }
}
