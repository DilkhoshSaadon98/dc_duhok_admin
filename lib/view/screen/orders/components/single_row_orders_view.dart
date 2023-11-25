// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin_app/core/constant/apptheme.dart';

class SingleRowOrdersView extends StatelessWidget {
  final bool isNumber;
  final String title;
  final String data;
  const SingleRowOrdersView({
    Key? key,
    required this.isNumber,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: bodyStyle),
        Text(data,
            style: isNumber == true
                ? numberStyle.copyWith(fontSize: 15)
                : bodyStyle),
      ],
    );
  }
}
