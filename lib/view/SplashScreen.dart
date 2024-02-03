import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/data/App_Exception/Apps_Exception.dart';
import 'package:mvvm/resources/assets/image_assets.dart';
import 'package:mvvm/resources/colors/app_colors.dart';
import 'package:mvvm/resources/components/genarel_exception.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/resources/fonts/app_fonts.dart';
import 'package:mvvm/resources/lottie/app_lottie.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/services/splash_services/splash_services.dart';

import '../resources/components/internetExceptionWidget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splash = SplashServices();

  @override
  void initState() {
    splash.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.cyanColor,

      body: Center(
        child: Text("splashScreen_Text".tr,style: TextStyle(
          fontSize: 20,
          color: AppColor.blackColor,
          fontFamily: AppFonts.roboto_light
        ),),
      ),


    );

  }
}
