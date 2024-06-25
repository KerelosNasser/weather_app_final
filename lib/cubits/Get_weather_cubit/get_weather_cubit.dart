
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_model.dart';

import '../../Services/Weather_Services.dart';
import 'get_weather_state.dart';
class GetWeatherCubit extends Cubit<WeatherState> {
  final WeatherServices weatherServices;

  GetWeatherCubit(this.weatherServices) : super(NoWeatherState());

  Future<void> getWeather({required String value}) async {
    emit(WeatherLoadingState());
    try {
      WeatherModel weatherModel = await weatherServices.getCurrentWeather(cityName: value);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
