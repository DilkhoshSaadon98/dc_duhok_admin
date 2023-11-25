import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/middleware/mymiddleware.dart';
import 'package:admin_app/view/screen/monthly_selling/monthly_selling_view.dart';
import 'package:admin_app/view/screen/notifications/components/notification_details.dart';
import 'package:admin_app/view/screen/notifications/notification_screen.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/forget_password_screen.dart';
import 'package:admin_app/view/screen/auth/login_screen.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/verify_code_reset_password.dart';
import 'package:admin_app/view/screen/catagories/catagories_add_screen.dart';
import 'package:admin_app/view/screen/catagories/catagories_edit_screen.dart';
import 'package:admin_app/view/screen/catagories/catagories_view_screen.dart';
import 'package:admin_app/view/screen/home/home_screen.dart';
import 'package:admin_app/view/screen/items/items_add_screen.dart';
import 'package:admin_app/view/screen/items/items_edit_screen.dart';
import 'package:admin_app/view/screen/items/items_view_screen.dart';
import 'package:admin_app/view/screen/orders/main_screen_orders.dart';
import 'package:admin_app/view/screen/orders/details_screen.dart';
import 'package:admin_app/view/screen/orders/pending_screen.dart';
import 'package:admin_app/view/screen/users/users_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => HomeScreen(), middlewares: [MyMiddleWare()]),
  //!  Auth
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(
      name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(
      name: AppRoute.verfiyCode, page: () => const VerfiyCodeResetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  //!
  GetPage(name: AppRoute.homepage, page: () => HomeScreen()),
  //! Orders :
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  //GetPage(name: AppRoute.offersProductDetails, page: () => const OffersProductDetails()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersHome, page: () => const MainOrdersScreen()),

  //!Catagories:
  GetPage(name: AppRoute.catagoriesView, page: () => const CatagoriesView()),
  GetPage(name: AppRoute.catagoriesAdd, page: () => const CatagoriesAdd()),
  GetPage(name: AppRoute.catagoriesEdit, page: () => const CatagoriesEdit()),
  //! Users:
  GetPage(name: AppRoute.usersView, page: () => const UsersScreen()),
  //!Items:
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsEdit, page: () => const ItemsEdit()),
//! Notifications:
  GetPage(
      name: AppRoute.notificationView, page: () => const NotificationScreen()),
  GetPage(
      name: AppRoute.notificationViewDetails,
      page: () => const NotificationDetailsScreen()),
  GetPage(
      name: AppRoute.monthlySellingView,
      page: () => const MonthlySellingView()),
];
