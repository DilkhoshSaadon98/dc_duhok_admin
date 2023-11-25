
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.usersView, {});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.usersDelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
