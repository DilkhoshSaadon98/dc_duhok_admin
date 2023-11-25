import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handing_data_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/core/shared/custom_snack_bar.dart';
import 'package:admin_app/data/datasource/remote/auth/login.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// abstract class LoginController extends GetxController {
//   login();
//   goToSignUp();
//   goToForgetPassword();
// }

// class LoginControllerImp extends LoginController {
//   LoginData loginData = LoginData(Get.find());

//   GlobalKey<FormState> formstate = GlobalKey<FormState>();

//   late TextEditingController email;
//   late TextEditingController password;

//   bool isshowpassword = true;

//   MyServices myServices = Get.find();

//   StatusRequest statusRequest = StatusRequest.none;

//   showPassword() {
//     isshowpassword = isshowpassword == true ? false : true;
//     update();
//   }

//   @override
//   login() async {
//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await loginData.postdata(email.text, password.text);
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           if (response['data']['admins_approve'] == 1) {
//             myServices.sharedPreferences
//                 .setString("id", response['data']['admin_id'].toString());

//             ///   String userid = myServices.sharedPreferences.getString("id")!;
//             myServices.sharedPreferences
//                 .setString("username", response['data']['admins_name']);
//             myServices.sharedPreferences
//                 .setString("email", response['data']['admins_email']);
//             myServices.sharedPreferences
//                 .setString("phone", response['data']['admins_phone']);
//             myServices.sharedPreferences.setString("step", "2");

//             FirebaseMessaging.instance.subscribeToTopic("admin");
//             FirebaseMessaging.instance.subscribeToTopic(
//                 "users${myServices.sharedPreferences.getString('username')}");
//             Get.offNamed(AppRoute.homepage);
//           } else {
//             Get.toNamed(AppRoute.verfiyCodeSignUp,
//                 arguments: {"email": email.text});
//           }
//         } else {
//           Get.defaultDialog(
//               title: "ُWarning", middleText: "Email or Password Not Correct");
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     } else {}
//   }

//   @override
//   goToSignUp() {
//     Get.offNamed(AppRoute.signUp);
//   }

//   @override
//   void onInit() {
//     // FirebaseMessaging.instance.getToken().then((value) {
//     //   print(value);
//     //   String? token = value;
//     // });
//     email = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }

//   @override
//   goToForgetPassword() {
//     Get.toNamed(AppRoute.forgetPassword);
//   }
// }
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstateLogin = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  //! Show Password and Hide :
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  Future<void> loginUser() async {
    if (formstateLogin.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        User? user = userCredential.user;
        if (user != null && user.emailVerified) {
          print('emailVerified --------------------');
          String adminId = user.uid.toString();
          myServices.sharedPreferences.setString("adminID", adminId);
          await login();
        } else if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          customSnackBar(
              'Warning',
              'Your Email Not Verified, Please Check Your Email Folder Then Follw Link To Active Your Account.',
              true);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          customSnackBar(
              'Error', 'User with this email does not exist.'.tr, true);
        } else if (e.code == 'wrong-password') {
          customSnackBar('Error', 'Incorrect password.', true);
        } else if (e.code == 'invalid-email') {
          customSnackBar('Error', 'Your Email Not Valid.', true);
        } else {
          // Handle other authentication errors
          customSnackBar('Error', e.message.toString(), true);
        }
      }
    }
  }

  //! Login Method :
  @override
  login() async {
    if (formstateLogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postdata(email.text.trim(), password.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['admins_id'].toString());
          String adminID = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("username", response['data']['admins_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['admins_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['admins_phone']);
          myServices.sharedPreferences
              .setString("firstname", response['data']['admins_firstname']);
          myServices.sharedPreferences
              .setString("lastname", response['data']['admins_lastname']);
          myServices.systemSharedPreferences.setString("step", "2");
          // FirebaseMessaging.instance.subscribeToTopic("admins");
          // FirebaseMessaging.instance.subscribeToTopic("admins$adminID");
          Get.offAllNamed(AppRoute.homepage);
        }
        // else {
        //   Get.defaultDialog(
        //       title: 'Error'.tr,
        //       titleStyle: titleStyle,
        //       content: Text(
        //         textAlign: TextAlign.center,
        //         'Invalid username or password.\n Please try again.',
        //         style: bodyStyle,
        //       ),
        //       actions: [
        //         CircleAvatar(
        //           backgroundColor: primaryColor,
        //           child: IconButton(
        //             onPressed: () {
        //               Get.back();
        //             },
        //             icon: const Icon(
        //               Icons.check,
        //               color: secondColor,
        //             ),
        //           ),
        //         )
        //       ]);
        //   statusRequest = StatusRequest.failure;
        // }
      }
      update();
    } else {}
  }

  //! go to sign up :
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
