class WeatherModel {
  final String place;
  final String date;
  final String image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel({
    required this.place,
    required this.date,
    required this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    final current = json['current'] ?? {};
    final condition = current['condition'] ?? {};

    return WeatherModel(
      place: location['name'] ?? 'Unknown Location',
      date: current['last_updated'] ?? 'Unknown Date',
      image: condition['icon'] ?? '',
      temp: (current['temp_c'] as num?)?.toDouble() ?? 0.0,
      minTemp: (current['mintemp_c'] as num?)?.toDouble() ?? 0.0,
      maxTemp: (current['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
      condition: condition['text'] ?? 'Unknown Condition',
    );
  }
}