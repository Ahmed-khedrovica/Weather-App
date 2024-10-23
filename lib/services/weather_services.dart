import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices
{
  final Dio dio;
  WeatherServices(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '2c1462488a924fcc95d233239242309';

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async{
  try {
    Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    
    return weatherModel;
  } on DioException catch (e) {
    return null;
  }
  }
}