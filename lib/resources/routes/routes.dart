import 'package:get/get.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view/HomeScreen.dart';
import 'package:mvvm/view/LoginScreen.dart';

import '../../view/SplashScreen.dart';

class AppRoutes{

  static appRoutes()=>[
    GetPage(name: RouteName.splashScreen, page: ()=> const SplashScreen(),transition: Transition.leftToRight, transitionDuration:const Duration(milliseconds: 500)),
    GetPage(name: RouteName.loginScreen, page: ()=> const LoginScreen(),transition: Transition.leftToRight, transitionDuration:const Duration(milliseconds: 500),),
    GetPage(name: RouteName.homeScreen, page: ()=> const HomeScreen(),transition: Transition.leftToRight, transitionDuration:const Duration(milliseconds: 500),),

  ];

}