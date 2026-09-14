import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';
 import '../screen/home_page.dart';

class CustomMaterialapp extends StatelessWidget {
  const CustomMaterialapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weather?.condition),
       ),
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
MaterialColor getWeatherColor(String ?condition) {
  if (condition == null) return Colors.blue;
  switch (condition.trim().toLowerCase()) {

  // ☀️ Sunny
    case 'sunny':
      return Colors.orange;

  // ☁️ Cloudy
    case 'partly cloudy':
      return Colors.blue;

    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

  // 🌫️ Haze / Fog / Smoke / Dust
    case 'haze':
    case 'dust haze':
    case 'blowing dust':
    case 'dust storm':
    case 'sandstorm':
    case 'severe sandstorm':
    case 'mist':
    case 'smoke':
    case 'smoky haze':
    case 'smog':
    case 'severe smog':
    case 'saharan dust':
    case 'dust':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

  // 🌧️ Drizzle
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy freezing drizzle possible':
      return Colors.cyan;

  // 🌧️ Rain
    case 'patchy rain possible':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.indigo;

  // 🌦️ Rain showers
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.indigo;

  // 🧊 Freezing rain
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;

  // 🌨️ Sleet
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.cyan;

  // ❄️ Snow
    case 'patchy snow possible':
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;

  // 🧊 Ice
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.teal;

  // ⛈️ Thunder
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

  // Default
    default:
      return Colors.blue;
  }
}
