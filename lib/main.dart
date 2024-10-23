import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => GetWeatherCubit(),
       child: Builder(
         builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
           return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition),
            ),
            home: const HomeView(),
               );
  },
),
       ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if(condition == null){
    return Colors.blue;
  }

  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange; // MaterialColor
    case 'partly cloudy':
      return Colors.lightBlue; // MaterialColor
    case 'cloudy':
    case 'overcast':
      return Colors.grey; // MaterialColor
    case 'mist':
      return Colors.blueGrey; // MaterialColor
    case 'patchy rain possible':
    case 'light drizzle':
    case 'patchy light drizzle':
    case 'light rain':
    case 'patchy light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.blue; // MaterialColor
    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.blueGrey; // MaterialColor
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.cyan; // MaterialColor
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'blizzard':
    case 'blowing snow':
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.indigo; // MaterialColor
    case 'fog':
      return Colors.grey; // MaterialColor
    case 'freezing fog':
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple; // MaterialColor
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
    default:
      return Colors.blue; // Fallback MaterialColor for undefined conditions
  }
}
