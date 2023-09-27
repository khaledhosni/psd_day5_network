
import 'package:dio/dio.dart';

class API{
static final API instance= API._();

  Dio dio= Dio();

  API._(){
    dio.options.connectTimeout=Duration(seconds: 50);
    dio.options.baseUrl="https://618ebc2e50e24d0017ce141f.mockapi.io/";
  }

  factory API(){
    return instance;
  }

}