import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/screen/search_screen.dart';
import 'package:weather_app/widget/custom_materialapp.dart';
import 'package:weather_app/widget/no_weather_widget.dart';
import 'package:weather_app/widget/weather_info_body.dart';

import '../cubit/get_weather_cubit/get_weather_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),

      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is initialState) {
            return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue.shade300,
                    Colors.blue.shade50,
                  ],
                  begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
                child: NoWeatherWidget());
          } else if (state is GetWeatherState) {
            return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    getWeatherColor(state.weather.condition),
                    getWeatherColor(state.weather.condition).shade300,
                    getWeatherColor(state.weather.condition).shade50,
                  ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
                child: WeatherInfoBody(weather: state.weather));
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
