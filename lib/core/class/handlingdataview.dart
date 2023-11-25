import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            alignment: Alignment.center,
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Column(
                children: [
                  Center(
                      child: Lottie.asset(AppImageAsset.offline,
                          width: 250, height: 250)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Internet',
                    style: titleStyle,
                  )
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Column(
                    children: [
                      Center(
                          child: Lottie.asset(AppImageAsset.server,
                              width: 250, height: 250)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Server Failure',
                        style: titleStyle,
                      )
                    ],
                  )
                : statusRequest == StatusRequest.failure
                    ? Column(
                        children: [
                          Center(
                              child: Lottie.asset(AppImageAsset.noData,
                                  width: 250, height: 250, repeat: true)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'No Data',
                            style: titleStyle,
                          )
                        ],
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Column(
            children: [
              Center(
                  child: Lottie.asset(AppImageAsset.loading,
                      width: 250, height: 250)),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Loading ...',
                style: titleStyle,
              )
            ],
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Column(
                children: [
                  Center(
                      child: Lottie.asset(AppImageAsset.offline,
                          width: 250, height: 250)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Internet',
                    style: titleStyle,
                  )
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Column(
                    children: [
                      Center(
                          child: Lottie.asset(AppImageAsset.server,
                              width: 250, height: 250)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Server Fail',
                        style: titleStyle,
                      )
                    ],
                  )
                : widget;
  }
}
