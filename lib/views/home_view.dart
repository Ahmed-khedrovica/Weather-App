import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Weather App'
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
                  Icons.search_rounded,
                color: Colors.black54,
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)
                {
                  return SearchView();
                }));
              },
            ),
          ),
        ],
      ),
      body:
         BlocBuilder<GetWeatherCubit, WeatherState>(
           builder: (context, state){
            if(state is WeatherInitialState){
              return const NoWeatherBody();
            }
            else if(state is WeatherLoadedState){
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            }
            else{
              return const Text('opps Erorr');
            }
         },
         ),
    );
  }
}

