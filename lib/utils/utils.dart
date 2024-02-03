import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvm/resources/colors/app_colors.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessageBottom(String message){

    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.BOTTOM
    );

  }
  static toastMessageCenter(String message){

    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.CENTER
    );

  }
  static toastMessageTop(String message){

    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.TOP
    );

  }

  static snackMessage(String title, String message){
    Get.snackbar(title,message);
  }


}