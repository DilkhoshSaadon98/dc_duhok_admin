import 'package:admin_app/controller/orders/archive_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: Text(
        'Rating Order',
        textAlign: TextAlign.center,
        style: titleStyle.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: titleStyle.copyWith(fontSize: 15),
      ),
      starSize: 25,
      image: Image.asset(AppImageAsset.logo),
      submitButtonText: 'Submit',
      commentHint: 'Rate Your Order',
      onCancelled: () {},
      onSubmitted: (response) async{
        OrdersArchiveController controller = Get.find();
        await controller.submitRating(orderId, response.rating.toString(), response.comment);
        
      },
    ),
  );
}
