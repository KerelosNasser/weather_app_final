
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/home_screen.dart';
import 'Services/Weather_Services.dart';
import 'cubits/Get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherServices weatherServices = WeatherServices(Dio());

    return BlocProvider(
      create: (context) => GetWeatherCubit(weatherServices),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
