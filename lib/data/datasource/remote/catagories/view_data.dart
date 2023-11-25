import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class CatagoriesData {
  Crud crud;
  CatagoriesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.catagoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithOneImage(AppLink.catagoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data, [File? file]) async {
    var response;
    if(file == null ){
    response = await crud.postData(AppLink.catagoriesEdit, data);
      
    }else{
      response =
        await crud.addRequestWithOneImage(AppLink.catagoriesAdd, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    
    var response = await crud.postData(AppLink.catagoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
