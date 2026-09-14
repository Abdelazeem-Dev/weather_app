import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
final WeatherModel weather ;
  @override
  Widget build(BuildContext context) {
    return

 Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(weather.city,style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      )),
      const SizedBox(height: 16,),
      Text('Update at  ${weather.date.hour}:${weather.date.minute}',style: TextStyle(
        fontSize: 22,
      )),
      const SizedBox(height: 16,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.sunny,size: 32,),
          Text('${weather.temp}°C',style: TextStyle(
            fontSize: 32,
          ),),
          Column(
            children: [
              Text('Max Temp: ${weather.maxTemp}°C'),
              Text('Min Temp:  ${weather.minTemp}°C'),
            ],
          )
        ]
      ),
      Text(weather.condition,style: TextStyle(
        fontSize: 32,
      ),),

    ]
  ),
);
  }
}
