import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var keyS = GlobalKey<ScaffoldState>()  ;
  late SearchDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(

            key: keyS,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    WeatherCubit.get(context).status.toLowerCase() =='clear'?'assets/images/sunny.png':'assets/images/cloud.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                   const Text(
                    'Today , 18 Feb',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21),
                  ),
                   const SizedBox(height: 25,) ,
                   Text(
                    '${WeatherCubit.get(context).temp.round()}°',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 44),
                  ),

                  Text(
                    WeatherCubit.get(context).status,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.white),
                  ),
                  const SizedBox(height: 25,) ,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0x0ffaaaaa),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/sun+cloud.png',
                              width: 70,
                            ),
                             Text(
                              '${WeatherCubit.get(context).Mintemp.round()}°',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            const Text(
                              'Max Temp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0x0ffaaaaa),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/wind.png',
                              width: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '${WeatherCubit.get(context).wind.round()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                                const Text(
                                  'Km/h',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),

                              ],
                            ) ,
                            const SizedBox(height: 5,) ,
                            const Text(
                              'Wind Speed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),


                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0x0ffaaaaa),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/rain.png',
                              width: 70,
                            ),
                            // const SizedBox(height: 20,) ,
                             Text(
                              '${WeatherCubit.get(context).humidity}°',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            const Text(
                              'Humidity',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,) ,

                  Container(

                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButton(
                      isDense: false,
                      isExpanded: false,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      value: WeatherCubit.get(context).city,
                      onChanged: (value)
                      {
                        WeatherCubit.get(context).EqualValues(value!);
                        WeatherCubit.get(context).getDirection() ;

                      },
                      items: WeatherCubit.get(context).cities
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
