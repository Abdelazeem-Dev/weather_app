import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widget/custom_materialapp.dart';
import 'cubit/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),

      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) => CustomMaterialapp(),
      ),
    );
  }
}
