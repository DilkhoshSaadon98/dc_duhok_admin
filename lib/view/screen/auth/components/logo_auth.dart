import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAuth extends StatelessWidget {
  final String title;
  const LogoAuth({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      height: 225,
      child: Lottie.asset(
        title,
        width: 400,
        height: 400,
      ),
    );
  }
}
