
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/resources/colors/app_colors.dart';
import 'package:mvvm/resources/fonts/app_fonts.dart';
import 'package:mvvm/resources/lottie/app_lottie.dart';

class InternetExceptionWidget extends StatelessWidget {

  final VoidCallback onPress;
  final bool loading;


   InternetExceptionWidget({super.key, required this.onPress,  this.loading = false,});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(AppLottie.noInternet,height: MediaQuery.of(context).size.height*.5,width: double.infinity,fit: BoxFit.fill),
          InkWell(
            onTap: (){
              onPress;
            },
            child: Container(
              width: MediaQuery.of(context).size.width*.7,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),

              child: loading
                  ? Center(child: CircularProgressIndicator()): Center(
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
