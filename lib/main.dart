import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/resources/colors/app_colors.dart';
import 'package:mvvm/resources/localization/Languages.dart';
import 'package:mvvm/resources/routes/routes.dart';
import 'package:mvvm/view/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale("en","US"),
      fallbackLocale: const Locale("en","US"),
      theme: ThemeData(
        primaryColor: AppColor.whiteColor,
        useMaterial3: false

      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
