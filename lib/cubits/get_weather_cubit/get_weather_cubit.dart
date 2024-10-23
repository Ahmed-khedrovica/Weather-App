
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_services.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit <WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

 WeatherModel? weatherModel;
  getWeather({required cityname}) async {
     try {
       weatherModel =
               (await WeatherServices(Dio()).getCurrentWeather(cityName: cityname))!;
        emit(WeatherLoadedState(weatherModel!));
     } catch (e) {
        emit(WeatherFailureState(errorMessage: e.toString()));
     }
  }
}