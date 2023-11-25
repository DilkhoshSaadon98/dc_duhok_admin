
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.home,{});
    return response.fold((l) => l, (r) => r);
  }
}
