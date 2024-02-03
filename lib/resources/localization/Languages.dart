import 'package:get/get.dart';

class Languages extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'splashScreen_Text': "LWMSOFT LTD",
      'email_hint': "Enter Your E-mail",
      'password_hint':"Enter Your Password",
      'login_header_text':"Login Page",
      'Login_button_text':"Login",
    },

    'bn_US':{
      'splashScreen_Text': "LWMSOFT LTD",
      'email_hint': "আপনার ই-মেল দিন",
      'password_hint':"আপনার পাসওয়ার্ড দিন",
      'login_header_text':"Login Page",
      'Login_button_text':"Login",
    },
    'hi_IND':{
      'splashScreen_Text': "LWMSOFT LTD",
      'email_hint': "अपना ईमेल दर्ज करें",
      'password_hint':"अपना कूटशब्द भरें",
      'login_header_text':"Login Page",
      'Login_button_text':"Login",
    }


  };

}