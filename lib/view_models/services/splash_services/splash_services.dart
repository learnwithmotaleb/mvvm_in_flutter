import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices{

  UserPreferences userPreferences = UserPreferences();

  void isLogin(){

    userPreferences.getUser().then((value){

      if (kDebugMode) {
        print(value.token.toString());
        print(value.isLogin.toString());
      }

      if(value.isLogin == false || value.isLogin.toString() == "null"){
        Timer(const Duration(seconds: 2),()=>Get.toNamed(RouteName.loginScreen,));

      }else{
        Timer(const Duration(seconds: 2),()=>Get.toNamed(RouteName.homeScreen,));

      }


    }).onError((error, stackTrace){

    });


  }

}