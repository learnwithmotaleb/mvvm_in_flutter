import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm/models/login/user_model.dart';
import 'package:mvvm/repository/login_repository/login_repository.dart';
import 'package:mvvm/resources/routes/routes.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginController extends GetxController{

  final _api = LoginRepository();
  UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi(){
    loading.value = true;
    Map data = {
      "email": emailController.value.text ,
      "password": passwordController.value.text
    };

    _api.loginApi(data).then((value){
      Utils.snackMessage("Login", "Login Successful");
      UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true

      );
      userPreferences.saveUser(userModel).then((value){
        Get.toNamed(RouteName.homeScreen);
      }).onError((error, stackTrace){
        Utils.snackMessage("Save Error: ", error.toString());
      });
      loading.value = false;
    }).onError((error, stackTrace){
      Utils.snackMessage("Error", error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
      loading.value = false;
    });
  }





}