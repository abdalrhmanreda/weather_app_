abstract class WeatherState{}

class InitialWeatherState extends WeatherState{}

class ChangeIndexState extends WeatherState{}

class EqaulValueState extends WeatherState{}

class GetDirectionSuccessState extends WeatherState{}
class GetDirectionErrorState extends WeatherState{
  final String error ;
  GetDirectionErrorState(this.error) ;
}

class GetWeatherSuccessState extends WeatherState{}
class GetWeatherErrorState extends WeatherState{
  final String error ;
  GetWeatherErrorState(this.error) ;
}