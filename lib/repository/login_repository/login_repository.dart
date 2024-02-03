import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_url/app_url.dart';

class LoginRepository{

  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data)async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }


}