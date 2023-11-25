import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithOneImage(AppLink.itemsAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data, [File? file]) async {
    var response;
    if(file == null ){
    response = await crud.postData(AppLink.itemsEdit, data);
      
    }else{
      response =
        await crud.addRequestWithOneImage(AppLink.catagoriesAdd, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    
    var response = await crud.postData(AppLink.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
