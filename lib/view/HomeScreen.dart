import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/data/App_Exception/Apps_Exception.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/resources/components/genarel_exception.dart';
import 'package:mvvm/resources/components/internetExceptionWidget.dart';
import 'package:mvvm/resources/fonts/app_fonts.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view_models/controller/home_controller/home_controller.dart';
import 'package:mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

import '../resources/colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferences userPreferences = UserPreferences();
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facelwm",style: TextStyle(
          fontFamily: AppFonts.roboto_light,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                userPreferences.clearUser().then((value) {
                  Get.toNamed(RouteName.loginScreen);
                });
              },
              child: const Icon(Icons.logout,color: AppColor.whiteColor,
                size: 20,

              ))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (BuildContext context, int index) {

                  return Card(
                    child: ListTile(
                      onTap: (){
                        // Get.toNamed(RouteName.homeScreen,arguments:[
                        //   "Hello World",
                        //   "Hello World",
                        //   "Hello World",
                        //   "Hello World",
                        // ]);
                      },
                      title: Text(homeController.userList.value.data![index].firstName.toString() +" "+ homeController.userList.value.data![index].lastName.toString()),
                      leading: CircleAvatar(
                        backgroundImage:NetworkImage(
                            homeController.userList.value.data![index].avatar.toString()
                        ),
                      ),
                      subtitle: Text(homeController.userList.value.data![index].email.toString()),
                      trailing: TextButton(onPressed: (){

                      },
                      child: Text("Add Friend"),),
                    ),
                  );
                });
          case Status.ERROR:

            if(homeController.error.value == "No Internet null"){

              return InternetExceptionWidget(
                  loading:true, onPress: (){
                homeController.refreshUserListApi();
              });
            }else{
              return  Center(
                child: Text("Some thing went worng"),
              );
            }

        }
        return const SizedBox();
      }),
    );
  }
}
