import 'package:admin_app/controller/home_controller.dart';
import 'package:admin_app/core/constant/apptheme.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Drawer(
      backgroundColor: AppColor.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            arrowColor: secondColor,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            accountEmail: Text(
              // myServices.sharedPreferences.getString('email')!,
              // style: bodyStyle.copyWith(color: secondColor, fontSize: 16),
              'example@gmail.com'
            ),
            accountName: Text(
              // myServices.sharedPreferences
              //     .getString('username')!
              //     .capitalizeFirst!,
              // style: titleStyle.copyWith(color: secondColor, fontSize: 18),
              'Dilkhosh'
            ),
          ),
          GetBuilder<HomeController>(builder: (controller) {
            return Column(
              children: [
                ...List.generate(
                  controller.imageAssets.length,
                  (index) => ListTile(
                    leading: SvgPicture.asset(
                      controller.imageAssets[index],
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      controller.titleData[index],
                      style: titleStyle,
                    ),
                    onTap: controller.voidData[index],
                  ),
                )
              ],
            );
          }),
          //! App Language :
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.language,
              color: primaryColor,
            ),
            title: Text(
              'App Language',
              style: titleStyle,
            ),
          ),
          //! Log Out :
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: primaryColor,
            ),
            title: Text(
              'App Language',
              style: titleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
