import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/resources/lottie/app_lottie.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/controller/loginController/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("login_header_text".tr),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                  child: Column(
                children: [
                  SizedBox(height: 20,),
                  Lottie.asset(AppLottie.running,width: double.infinity,height: 200),
                  SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController.value,
                    focusNode: controller.emailFocusNode.value,
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackMessage("email_hint".tr,"email_hint".tr,);
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, controller.emailFocusNode.value, controller.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: "email_hint".tr,

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.passwordController.value,
                    focusNode: controller.passwordFocusNode.value,
                    obscuringCharacter: "#",
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackMessage("password_hint".tr,"password_hint".tr,);
                      }
                    },
                    onFieldSubmitted: (value){

                    },

                    decoration: InputDecoration(
                        hintText: "password_hint".tr,

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              )),
              Obx(() => RoundButton(
                title: "Login_button_text".tr,
                loading: controller.loading.value,
                onPress: (){
                  if(_formKey.currentState!.validate()){
                    controller.loginApi();
                  }

                },width: MediaQuery.of(context).size.width,))
            ],
          ),
        ),
      ),
    );
  }
}
