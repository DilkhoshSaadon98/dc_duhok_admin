import 'package:admin_app/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button_auth.dart';
import '../components/custom_textbody_auth.dart';
import '../components/custom_textform_auth.dart';
import '../components/custom_texttitle_auth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      const SizedBox(height: 40),
                      CustomTextTitleAuth(text: "Forget Password".tr),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomTextTitleAuth(text: "Check Email".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          // please Enter Your Email Address To Recive A verification code
                          text:
                              "please Enter Your Email Address To Recive A verification code"
                                  .tr),
                      const SizedBox(height: 25),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "E-mail".tr,
                        // mycontroller: ,
                      ),
                      const Spacer(),
                      CustomButtomAuth(
                          text: "Check".tr,
                          onPressed: () {
                            controller.checkemail();
                          }),
                      const SizedBox(height: 20),
                    ]),
                  ),
                ),
              ))),
    );
  }
}
