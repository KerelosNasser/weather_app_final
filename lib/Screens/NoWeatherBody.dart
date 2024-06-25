import 'package:flutter/material.dart';
import 'package:weather/Screens/search_screen.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenSize = MediaQuery.of(context).size;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.black54],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding:  const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
             icon: const Icon(Icons.search_outlined),
              iconSize: screenSize.width * 0.3,
              color: Colors.white.withOpacity(0.8),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Search for a city to get started....',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24 * textScaleFactor,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                    color: Colors.black38,
                  ),
                ],
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
