import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mvvm/resources/colors/app_colors.dart';

import '../fonts/app_fonts.dart';

class RoundButton extends StatelessWidget {


  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  const RoundButton({super.key,
    this.loading = false,
    required this.title,
    this.height= 50,
    this.width = 200,
    required this.onPress,
    this.textColor = AppColor.whiteColor,
    this.buttonColor = AppColor.blueColor,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading
            ? Center(child: CircularProgressIndicator()) :
            Center(child: Text(title,style: TextStyle(
                fontFamily: AppFonts.roboto_light,
                color: Colors.white,
                fontSize: 16
            ),),),
      ),
    );
  }
}
