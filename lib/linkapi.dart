class AppLink {
  static const String server = "https://dilkhoshsaadon.shop/admin";
//! Image Link-=-----------------------------
  // static const String imageststatic =
  //     "http://192.168.0.191/ecommercecourse/upload";
  // static const String linkStaticImageItems =
  //     "http://192.168.0.191/ecommerece/upload";
//========================== Image ============================
  static const String imagestCategories =
      "https://dilkhoshsaadon.shop/upload/catagories";
  static const String imagestItems =
      "https://dilkhoshsaadon.shop/upload/items";
// =============================================================
  static const String test = "$server/test.php";


//! Auth :
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  static const String home = "$server/home.php";
  //! Orders:
  static const String viewPendingOrders = "$server/orders/view_pending.php";
  static const String viewAcceptedOrders = "$server/orders/view_accepted.php";
  static const String viewArchiveOrders = "$server/orders/view_archive.php";
  static const String detailsOrders = "$server/orders/view_details.php";
  static const String approveOrders = "$server/orders/approve.php";
  static const String prepareOrders = "$server/orders/prepare.php";

  //! Users:
  static const String usersView = "$server/users_view.php";
  static const String usersDelete = "$server/delete_users.php";
  //! Notification;
  static const String deleteNotification =
      "$server/admin/orders/delete_notification.php";
  static const String offers = "$server/offers.php";

  //! Cat:
  static const String catagoriesView = "$server/catagories/view.php";
  static const String catagoriesAdd = "$server/catagories/add.php";
  static const String catagoriesEdit = "$server/catagories/update.php";
  static const String catagoriesDelete = "$server/catagories/delete.php";

  //! Items:
  static const String itemsView = "$server/items/view.php";
  static const String itemsAdd = "$server/items/add.php";
  static const String itemsEdit = "$server/items/update.php";
  static const String itemsDelete = "$server/items/delete.php";

  //! Notifications :
  static const String notificationView = "$server/notifications.php";
  //! Monthly Selling:
  static const String monthlySelling = "$server/monthly_selling/monthly_selling.php";
}
