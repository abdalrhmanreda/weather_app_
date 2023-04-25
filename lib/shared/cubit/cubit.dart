import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_by_me/network/remote/dio_helper.dart';
import 'package:weather_app_by_me/shared/cubit/state.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit():super(InitialWeatherState()) ;
  static WeatherCubit get(context)=>BlocProvider.of(context) ;

  List<BottomBarItem>items =const  [
  BottomBarItem(
    inActiveItem: Icon(Icons.home , color: Color(0xff0095eb),),
    activeItem:  Icon(Icons.home , color: Colors.white,) ,

  ) ,
  BottomBarItem(
    inActiveItem: Icon(Icons.search , color: Colors.white,),
    activeItem:  Icon(Icons.search , color: Color(0xff0095eb),) ,

  ) ,
  BottomBarItem(
    inActiveItem: Icon(Icons.person , color: Colors.white,),
    activeItem:  Icon(Icons.person , color: Color(0xff0095eb),) ,

  ) ,
];

int currentIndex = 0 ;
void ChangeNavigation(int index)
{
  currentIndex = index;
  emit(ChangeIndexState()) ;
}

  List<String> cities = [
    'cairo',
    'Alexandria',
    'Giza',
    'Port Said',
    'Gharbia',
    'Dakahlia',
    'Asyut',
    'Fayoum',
    'Sharqia',
    'Ismailia',
    'Qalyubia',
    'Aswan',
    'Beheira',
    'Minya',
    'Damietta',
    'Luxor',
    'Qena',
    'Sohag',
    'Monufia',
  ];
  String city = 'cairo';
void EqualValues(String value)
{
  city = value ;
  emit(EqaulValueState()) ;
}


late double lat ,lon ;
double temp = 0 ;
double Mintemp = 0 ;
double Maxtemp = 0 ;
int humidity = 0 ;
double wind = 0 ;
String status = "";

List<dynamic>weather =[] ;
void getWeather()
{
  DioHelper.getWeatherData(
    url: 'data/2.5/forecast',
    query: {
      'lat':lat ,
      'lon':lon ,
      'appid':'9705b410af9a04ff5740d49f2156ff8e'
    },
  ).then((value) {
    weather = value.data['list'] ;
   Mintemp= ((weather[0]['main']['temp_min'])-273);
   temp= ((weather[0]['main']['temp'])-273);
   Maxtemp= ((weather[0]['main']['temp_max'])-273);
   humidity= ((weather[0]['main']['humidity']));
   wind= ((weather[0]['wind']['speed']));
   status= ((weather[0]['weather'][0]['main']));
   print(wind) ;



    emit(GetWeatherSuccessState()) ;
  }).catchError((error) {
    print(error.toString()) ;
    emit(GetWeatherErrorState(error.toString())) ;
  });
}

void getDirection()
{
  DioHelper.getWeatherData(
      url: 'geo/1.0/direct',
      query: {
        'q':city ,
        'appid':'9705b410af9a04ff5740d49f2156ff8e'
      },
  ).then((value) {
    lat = value.data[0]['lat'];
    lon = value.data[0]['lon'];
    // print(lat) ;
    // print(lon) ;
    getWeather() ;
    emit(GetDirectionSuccessState()) ;
  }).catchError((error) {
    emit(GetDirectionErrorState(error.toString())) ;
  });

}


List<String>photo = [
  'assets/images/sunny.png' , //clear
  'assets/images/rainy.png' , // rain
  'assets/images/cloud.png' , // cloud
  '' ,

] ;


 image()
{
  if(status.toLowerCase() =='clear') {
    return 'assets/images/sunny.png' ;
  } else if(status.toLowerCase() =='clouds') {
    return  'assets/images/cloud.png ';
  } else if(status.toLowerCase() =='rain') {
    return 'assets/images/rainy.png';
  }
}


}