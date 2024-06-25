import 'package:dio/dio.dart';

import '../models/weather_model.dart';


class WeatherServices {
  final Dio dio;

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': 'ce9fb6a26bbb48998e9195349241406', // Replace with your actual API key
          'q': cityName,
          'aqi': 'no'
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to load weather data with status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // Handle Dio errors (e.g., network issues)
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      // Handle other unexpected errors
      throw Exception('Failed to load weather data: $e');
    }
  }
}
