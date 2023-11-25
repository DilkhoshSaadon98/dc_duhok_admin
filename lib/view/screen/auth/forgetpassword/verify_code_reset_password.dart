import 'package:admin_app/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../components/custom_textbody_auth.dart';
import '../components/custom_texttitle_auth.dart';

class VerfiyCodeResetPassword extends StatelessWidget {
  const VerfiyCodeResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(children: [
            const SizedBox(height: 50),
            Text(
              "Verification Code",
              style: titleStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 70),
            const CustomTextTitleAuth(text: "Check code"),
            const SizedBox(height: 50),
            const CustomTextBodyAuth(
                text: "Please Enter The Digit Code Sent To"),
            Text(
              "${controller.email}",
              style: titleStyle.copyWith(
                  fontSize: 20, color: AppColor.secondColor),
            ),
            const SizedBox(height: 30),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
