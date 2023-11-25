import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final    bool? readOnly;
  final bool? obscureText;
  final bool? isPassword;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.isPassword,this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: isNumber == true ? TextInputType.phone : TextInputType.text,
      controller: mycontroller,
      style: titleStyle.copyWith(fontWeight: FontWeight.w100, fontSize: 15),
      textAlign: TextAlign.start,
      obscureText: isPassword == true ? true : false,
      readOnly: readOnly??false,
      decoration: InputDecoration(
        
        hintText: hinttext.tr,
        hintStyle: bodyStyle,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        label: Text(
          labeltext.tr,
          style: titleStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        prefixIcon: Icon(
          iconData,
          color: myServices.sharedPreferences.getBool('mode') == true
              ? white
              : primaryColor,
        ),
        suffixIcon: labeltext == "Password".tr
            ? IconButton(
                onPressed: onTapIcon,
                icon: isPassword == true
                    ? Icon(
                        Icons.visibility_outlined,
                        color:
                            myServices.sharedPreferences.getBool('mode') == true
                                ? white
                                : primaryColor,
                      )
                    : Icon(Icons.visibility_off_outlined,
                        color:
                            myServices.sharedPreferences.getBool('mode') == true
                                ? white
                                : primaryColor),
              )
            : null,
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: AppColor.secondColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        errorBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: AppColor.thirdColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(constRadius))),
        focusedBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: myServices.sharedPreferences.getBool('mode') == true
                    ? white
                    : primaryColor,
                width: 1),
            borderRadius: const BorderRadius.all( Radius.circular(constRadius))),
      ),
    );
  }
}
