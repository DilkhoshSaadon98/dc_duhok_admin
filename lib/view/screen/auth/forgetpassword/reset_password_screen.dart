import 'package:admin_app/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button_auth.dart';
import '../components/custom_textbody_auth.dart';
import '../components/custom_textform_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: Column(children: [
                      const SizedBox(height: 50),
                      Text(
                        "Reset Password".tr,
                        style: titleStyle.copyWith(fontSize: 25),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      CustomTextBodyAuth(text: "Please Type New Password".tr),
                      const SizedBox(height: 10),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 8, 40, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "New Password".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 8, 40, "password");
                        },
                        mycontroller: controller.repassword,
                        hinttext: "Confirm password",
                        iconData: Icons.lock_outline,
                        labeltext: "Confirm Password".tr,
                        // mycontroller: ,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomButtomAuth(
                          text: "Save Changes".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          }),
                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
              ))),
    );
  }
}
