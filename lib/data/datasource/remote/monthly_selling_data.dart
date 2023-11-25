
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class MonthlySellingData {
  Crud crud;
  MonthlySellingData(this.crud);
  getData(String day , String month , String year) async {
    var response = await crud.postData(AppLink.monthlySelling, {'day':day , 'month':month , 'year':year});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.usersDelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
