import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_by_me/moduls/home_screen.dart';
import 'package:weather_app_by_me/shared/blocObserver.dart';
import 'package:weather_app_by_me/shared/cubit/cubit.dart';
import 'package:weather_app_by_me/shared/cubit/state.dart';

import 'models/nnn.dart';
import 'network/remote/dio_helper.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized() ;
  DioHelper.init() ;
  Bloc.observer = MyBlocObserver();
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>WeatherCubit()..getDirection() ) ,
        ],
        child: BlocConsumer<WeatherCubit,WeatherState > (
          listener: (context , state){},
          builder:  (context , state){
            return MaterialApp(
              darkTheme: ThemeData(
                scaffoldBackgroundColor: const Color(0xff0a0c1e),
                appBarTheme: const AppBarTheme(
                  backgroundColor: const Color(0xff0a0c1e),
                  elevation: 0 ,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.blueGrey ,
                      statusBarIconBrightness: Brightness.light
                  ) ,

                ),
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(
                      color: Colors.white  ,
                      fontFamily:'abdo'

                    )
                ),


              ) ,
              debugShowCheckedModeBanner: false,
              title: 'Weather App',
              theme: ThemeData(
                scaffoldBackgroundColor: const Color(0xffD6E2E9),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xffD6E2E9) ,
                  elevation: 0 ,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.blueGrey ,
                      statusBarIconBrightness: Brightness.light
                  ) ,

                ),
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(
                      color: Colors.black  ,

                    )
                ),

                primarySwatch: Colors.blue,
              ),
              themeMode: ThemeMode.dark,
              home:  HomeScreen(),
            );
          },
        ) ,
    ) ;
  }
}

/*
*   bottomNavigationBar:  AnimatedNotchBottomBar(
              pageController: _pageController,
              onTap: (index)
              {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              bottomBarItems: WeatherCubit.get(context).items,
              showBlurBottomBar: true,
              blurOpacity: 0.2,
              blurFilterX: 5.0,
              blurFilterY: 10.0,

            ) ,
* */