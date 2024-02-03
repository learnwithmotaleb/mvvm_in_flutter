import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/models/home/userlist_model.dart';
import 'package:mvvm/resources/app_url/app_url.dart';

class HomeRepository{

  final _apiService = NetworkApiServices();

  Future<UserList_Model> userListApi()async{
    dynamic response =await _apiService.getApi(AppUrl.userListUrl);
    return UserList_Model.fromJson(response);
  }


}