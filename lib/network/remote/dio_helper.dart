import 'package:dio/dio.dart';

//http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid={API key}
//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}
class DioHelper{
  static Dio ? dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/' ,
        receiveDataWhenStatusError: true
      ) ,
    );
  }


  static Future<Response>getWeatherData({
    required String url ,
    required Map<String, dynamic>query ,
})async
  {
    var response = await dio!.get(url , queryParameters: query) ;
    return response ;
  }


}