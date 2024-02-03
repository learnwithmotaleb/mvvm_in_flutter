import 'package:get/get.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/models/home/userlist_model.dart';
import 'package:mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController{
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserList_Model().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value)=> rxRequestStatus.value = _value;
  void setUserList(UserList_Model _value)=> userList.value = _value;
  void setError(String _value)=> error.value = _value;



  void userListApi(){
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshUserListApi(){

    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}