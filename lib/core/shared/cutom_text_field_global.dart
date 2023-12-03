import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormGlobal extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final bool? isPassword;
  bool? isDsc = false;
  final void Function()? onTapIcon;

  CustomTextFormGlobal(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.isPassword,
      this.isDsc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        minLines: isDsc == true ? 20 : 1,
        maxLines: isDsc == true ? 30 : 1,
        validator: valid,
        textInputAction: TextInputAction.next,
        keyboardType:
            isNumber == true ? TextInputType.phone : TextInputType.text,
        controller: mycontroller,
        style: titleStyle.copyWith(
            color: primaryColor, fontWeight: FontWeight.w100, fontSize: 15),
        textAlign: TextAlign.start,
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          label: Text(
            labeltext,
            style: titleStyle.copyWith(
                color: primaryColor, fontWeight: FontWeight.w100, fontSize: 15),
          ),
          prefixIcon: Icon(
            iconData,
            color: primaryColor,
          ),
          suffixIcon: labeltext == "Password"
              ? IconButton(
                  onPressed: onTapIcon,
                  icon: isPassword == true
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: primaryColor,
                        )
                      : const Icon(Icons.visibility_off_outlined,
                          color: primaryColor),
                )
              : null,
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.thirdColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}
