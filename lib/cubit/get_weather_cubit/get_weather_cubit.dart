 import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../service/weather_service.dart';
import 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(initialState());
      WeatherModel ?weather;
  Future<void> getWeather (String value) async{
    try{
        weather = await WeatherService().getWeather(value);
      emit(GetWeatherState(weather: weather!));
  }
    catch(e){
      emit(FalierWeatherState( error:e.toString() ));
    }
    }
  }

