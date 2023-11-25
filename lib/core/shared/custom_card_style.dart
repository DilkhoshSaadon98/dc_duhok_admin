import 'package:flutter/widgets.dart';

BoxDecoration customCardStyle(Color backClor, Color borderColor ,[Color? shadowColor]) {
  return BoxDecoration(
    color: backClor,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: borderColor, width: 1),
    boxShadow: [
      BoxShadow(
        spreadRadius: .5,
        offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
        blurRadius: 1,
        color: shadowColor??backClor,
      )
    ],
  );
}
