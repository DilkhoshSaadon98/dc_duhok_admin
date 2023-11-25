import 'package:admin_app/view/screen/orders/accepted_screen.dart';
import 'package:admin_app/view/screen/orders/archive_screen.dart';
import 'package:admin_app/view/screen/orders/pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersScreenController extends GetxController {
  changePage(int currentpage);
}

class OrdersScreenControllerImp extends OrdersScreenController {
  int currentpage = 0;

  List<Widget> listPage = const [OrdersPending(), OrdersAccepted() , OrdersArchiveView()];
  List bottomappbar = [
    {
      "title": "Pending",
      "outlined_icon": Icons.pending_actions_outlined,
      'fiiled_icon': Icons.pending_actions
    },
    {
      "title": "Accepte",
      "outlined_icon": Icons.check_outlined,
      'fiiled_icon': Icons.check_box
    },
    {
      "title": "Archive",
      "outlined_icon": Icons.archive_outlined,
      'fiiled_icon': Icons.archive
    },
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentpage = index;
    update();
  }
}
