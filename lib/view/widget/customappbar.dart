import 'package:admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  final IconData iconData;
  const CustomAppBar(
      {Key? key,
      required this.titleAppBar,
      this.onPressedSearch,
      this.onChanged,
      required this.mycontroller,
      this.iconData = Icons.favorite_border_outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primaryColor)),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5),
            prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                onPressed: onPressedSearch),
            hintText: titleAppBar,
            hintStyle: const TextStyle(fontSize: 18),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        )),
      ]),
    );
  }
}
