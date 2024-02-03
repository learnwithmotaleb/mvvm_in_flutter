class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException{

  InternetException([String? message]) : super(message, "No Internet ");


}

class RequestTimeOutException extends AppException{

  RequestTimeOutException([String? message]) : super(message, "Request Time Out");


}

class ServerException extends AppException{

  ServerException([String? message]) : super(message, "Internal Server Error!");


}

class InvalidURLException extends AppException{

  InvalidURLException([String? message]) : super(message, "Invalid Url Exception");


}

class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message, "");


}

