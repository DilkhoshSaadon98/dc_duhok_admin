
import 'package:admin_app/controller/orders/orders_screen_controller.dart';
import 'package:admin_app/view/widget/bottom_bar/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainOrdersScreen extends StatelessWidget {
  const MainOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => Scaffold(              
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
