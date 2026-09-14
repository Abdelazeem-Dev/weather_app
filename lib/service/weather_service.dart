import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
 final dio = Dio();
 final String apiKey = '65e3e138477c4d44a2c161555262708';
 final String baseUrl = 'https://api.weatherapi.com/v1';

 Future<WeatherModel> getWeather(String cityName) async {
  try{
final response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
final WeatherModel weather = WeatherModel.fromJson(response.data);
return weather ;
 }catch(e){
 throw Exception('Error getting weather');

 }
 }
 }
