
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/resources/colors/app_colors.dart';
import 'package:mvvm/resources/fonts/app_fonts.dart';
import 'package:mvvm/resources/lottie/app_lottie.dart';

class GenarelExceptionWidget extends StatefulWidget {
  const GenarelExceptionWidget({super.key, required this.onPress});

  final VoidCallback onPress;

  @override
  State<GenarelExceptionWidget> createState() => _GenarelExceptionWidgetState();
}

class _GenarelExceptionWidgetState extends State<GenarelExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.wifi_off,size: 70,color: AppColor.greyColor,),),
          SizedBox(height: 10,),
          Center(child: Text("We're unable to process your request\nplease try again",style: TextStyle(
            fontSize: 16,
            color: AppColor.greyColor
          ),),),
          SizedBox(height: 80,),
          InkWell(
            onTap: (){
              widget.onPress;
            },
            child: Container(
              width: MediaQuery.of(context).size.width*.7,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Center(
                child: Text('Retry',style: TextStyle(
                    fontFamily: AppFonts.roboto_light,
                    color: Colors.white,
                    fontSize: 16
                ),),
              ),
            ),
          )
        ],
      ),

    );
  }
}
