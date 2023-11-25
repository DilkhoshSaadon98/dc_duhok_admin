import 'package:admin_app/bindings/intialbindings.dart';
import 'package:admin_app/core/localization/translation.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await ScreenUtil.ensureScreenSize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
        designSize: Size(context.width, context.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) {
          ScreenUtil.init(ctx);
          return GetMaterialApp(
            translations: MyTranslation(),
            debugShowCheckedModeBanner: false,
            title: 'Admin App',
            locale: controller.language,
            initialBinding: InitialBindings(),
            // routes: routes,
            getPages: routes,
          );
        });
  }
}
