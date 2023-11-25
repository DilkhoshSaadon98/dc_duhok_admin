import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/rating_dialog.dart';
import 'package:admin_app/data/model/orders_model.dart';
import 'package:flutter/material.dart';

class CustomTotalPriceRow extends StatelessWidget {
  final void Function()? onPressedProp;
  final void Function()? onPressedAccept;
  bool isDone = false;
  final OrdersModel listdata;
  CustomTotalPriceRow({
    super.key,
    required this.listdata,
    required this.onPressedProp,
    required this.onPressedAccept,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total Price : ",
            style: titleStyle.copyWith(
                fontSize: 18,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold)),
        Text("${listdata.ordersTotalprice} IQ",
            style: numberStyle.copyWith(
                fontSize: 18, color: secondColor, fontWeight: FontWeight.bold)),
        const Spacer(),
        CircleAvatar(
          backgroundColor: secondColor,
          child: IconButton(
            onPressed: onPressedProp,
            icon: const Icon(Icons.info_outline),
            color: primaryColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        isDone == true
            ? CircleAvatar(
                backgroundColor: primaryColor,
                child: IconButton(
                    onPressed: () {
                      (showDialogRating(context, listdata.ordersId.toString()));
                    },
                    icon: const Icon(
                      Icons.rate_review_outlined,
                      color: secondColor,
                    )),
              )
            : listdata.ordersStatus! == 2
                ? CircleAvatar(
                    backgroundColor: primaryColor,
                    child: IconButton(
                      onPressed: onPressedAccept,
                      color: secondColor,
                      icon: const Icon(Icons.check),
                    ),
                  )
                : Container()
      ],
    );
  }
}
