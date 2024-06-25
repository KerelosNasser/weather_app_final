import 'package:flutter/material.dart';
import 'package:weather/Screens/search_screen.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.calendar_today),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherModel.place,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: getWeatherGradient(weatherModel.condition),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 30,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      left: 65,
                      child: getWeatherIcon(weatherModel.condition),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  '${weatherModel.temp}° C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  weatherModel.condition,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wind_power, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '11km/hr',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '02%',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.brightness_high, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '8hr',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Hourly Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weatherCard(
                    'Now',
                    29,
                    Icons.wb_sunny,
                    Colors.orange[300]!,
                  ),
                  weatherCard(
                    '5pm',
                    28,
                    Icons.wb_sunny,
                    Colors.orange[300]!,
                  ),
                  weatherCard(
                    '6pm',
                    28,
                    Icons.wb_sunny,
                    Colors.orange[300]!,
                  ),
                  weatherCard(
                    '7pm',
                    27,
                    Icons.wb_sunny,
                    Colors.orange[300]!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black87,
        items:  [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
                 icon: const Icon(Icons.search_outlined),
              ),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget weatherCard(String time, int temperature, IconData icon, Color iconColor) {
    return Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[900],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
          const SizedBox(height: 5),
          Text(
            '$temperature°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Icon getWeatherIcon(String condition) {
  condition = condition.toLowerCase();
  print("Weather Condition: $condition");

  if (condition.contains('sunny') || condition.contains('clear')) {
    return const Icon(Icons.wb_sunny, color: Colors.orange, size: 40);
  } else if (condition.contains('partly cloudy')) {
    return const Icon(Icons.cloud, color: Colors.grey, size: 40);
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return const Icon(Icons.cloud_queue, color: Colors.grey, size: 40);
  } else if (condition.contains('mist') || condition.contains('fog')) {
    return const Icon(Icons.blur_on, color: Colors.lightBlueAccent, size: 40);
  } else if (condition.contains('rain') || condition.contains('drizzle') || condition.contains('shower')) {
    return const Icon(Icons.grain, color: Colors.blue, size: 40);
  } else if (condition.contains('snow') || condition.contains('blizzard')) {
    return const Icon(Icons.ac_unit, color: Colors.lightBlue, size: 40);
  } else if (condition.contains('sleet') || condition.contains('freezing drizzle')) {
    return const Icon(Icons.ac_unit_outlined, color: Colors.lightBlueAccent, size: 40);
  } else if (condition.contains('thunder')) {
    return const Icon(Icons.flash_on, color: Colors.yellow, size: 40);
  } else if (condition.contains('ice pellets')) {
    return const Icon(Icons.ac_unit_outlined, color: Colors.cyan, size: 40);
  } else {
    return const Icon(Icons.help_outline, color: Colors.grey, size: 40); // Default icon for unknown conditions
  }
}

LinearGradient getWeatherGradient(String condition) {
  condition = condition.toLowerCase();
  print("Weather Condition for Gradient: $condition");

  if (condition.contains('sunny') || condition.contains('clear')) {
    return LinearGradient(
      colors: [Colors.orange[300]!, Colors.orange[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('partly cloudy')) {
    return LinearGradient(
      colors: [Colors.grey[300]!, Colors.grey[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return LinearGradient(
      colors: [Colors.grey[600]!, Colors.grey[800]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('mist') || condition.contains('fog')) {
    return LinearGradient(
      colors: [Colors.blueGrey[300]!, Colors.blueGrey[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('rain') || condition.contains('drizzle') || condition.contains('shower')) {
    return LinearGradient(
      colors: [Colors.blue[300]!, Colors.blue[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('snow') || condition.contains('blizzard')) {
    return LinearGradient(
      colors: [Colors.lightBlue[300]!, Colors.lightBlue[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('sleet') || condition.contains('freezing drizzle')) {
    return LinearGradient(
      colors: [Colors.cyan[300]!, Colors.cyan[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('thunder')) {
    return LinearGradient(
      colors: [Colors.yellow[300]!, Colors.yellow[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (condition.contains('ice pellets')) {
    return LinearGradient(
      colors: [Colors.cyan[300]!, Colors.cyan[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else {
    return LinearGradient(
      colors: [Colors.grey[300]!, Colors.grey[600]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ); // Default gradient for unknown conditions
  }
}
