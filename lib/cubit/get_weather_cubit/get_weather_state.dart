 import '../../models/weather_model.dart';

class WeatherState {}
 class initialState extends WeatherState{}

 class GetWeatherState extends WeatherState{
  final WeatherModel weather;
  GetWeatherState({required this.weather});
 }

 class FalierWeatherState extends WeatherState{
  final String error;
  FalierWeatherState({required this.error});
 }


