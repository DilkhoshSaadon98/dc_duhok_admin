import 'package:admin_app/controller/auth/login_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:admin_app/core/functions/alert_exit_app.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custom_button_global.dart';
import 'package:admin_app/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'components/custom_textform_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstateLogin,
                    child: ListView(children: [
                      // Image.asset(width: 200, height: 200, AppImageAsset.login),
                      Lottie.asset(
                        width: 200,
                        height: 200,
                        AppImageAsset.login,
                      ),
                      customSizedBox(20),
                      Text(
                        'Welcome To'.tr,
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            color: primaryColor, fontSize: 18),
                      ),
                      Text(
                        'Kurduino Store',
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(
                            color: secondColor, fontSize: 22),
                      ),
                      Text(
                        'Sign In With Your Email And Password'.tr,
                        textAlign: TextAlign.center,
                        style: bodyStyle.copyWith(
                            height: 1.5, color: primaryColor, fontSize: 14),
                      ),
                      customSizedBox(25),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "E-mail".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "E-mail".tr,
                        // mycontroller: ,
                      ),
                      customSizedBox(25),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "Type Your Password".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "Password".tr,
                        isPassword: controller.isshowpassword,
                        // mycontroller: ,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "Forget Password".tr,
                            textAlign: TextAlign.right,
                            style: titleStyle.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      customSizedBox(20),
                      CustomButtonGlobal(
                        text1: 'Log In'.tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      customSizedBox()
                    ]),
                  ),
                )),
          )),
    );
  }
}
