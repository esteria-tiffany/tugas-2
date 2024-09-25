import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Jakarta";
    int currTemp = 32;
    int maxTemp = 35;
    int minTemp = 31;

    Size size = MediaQuery.of(context).size;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                "Weather App",
                                style: GoogleFonts.questrial(
                                  color: isDarkMode ? Colors.white : Colors.brown,
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.circlePlus,
                              color: isDarkMode ? Colors.white : Colors.black,
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.0001,),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.0001,),
                        child: Align(
                          child: Text(
                            "Hari Ini",
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.0001),
                        child: Align(
                          child: Text(
                            "$currTemp°C",
                            style: GoogleFonts.questrial(
                              color: currTemp <= 0 ? Colors.pinkAccent :
                              currTemp > 0 && currTemp <= 20 ? Colors.purple :
                              currTemp > 21 && currTemp < 32 ? Colors.blue :
                              Colors.indigo,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.grey,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.0001,),
                        child: Align(
                          child: Text(
                            'Sunny', // weather
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.01,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$minTemp˚C', // min temperature
                              style: GoogleFonts.questrial(
                                color: minTemp <= 0 ? Colors.blueGrey :
                                minTemp > 0 && minTemp <= 15 ? Colors.indigo :
                                minTemp > 15 && minTemp < 30 ? Colors.deepPurple :
                                Colors.blue,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode ? Colors.white54 : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '$maxTemp˚C', // max temperature
                              style: GoogleFonts.questrial(
                                color: maxTemp <= 0 ? Colors.blue :
                                maxTemp > 0 && maxTemp <= 15 ? Colors.indigo :
                                maxTemp > 15 && maxTemp < 30 ? Colors.deepPurple:
                                Colors.blueGrey,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode ? Colors.white : Colors
                                          .black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      buildForecastToday(
                                        "Now", currTemp, 20, 0,
                                        FontAwesomeIcons.sun, size, isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "15:00", 1, 10, 40,
                                        FontAwesomeIcons.cloud, size, isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "16:00", 0, 25, 80,
                                        FontAwesomeIcons.cloudRain, size, isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "17:00", -2, 28, 60,
                                        FontAwesomeIcons.snowflake, size, isDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.grey,
                              ),
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.005),
                            child: Column(
                              children: [
                                buildSevenDayForecast(
                                  "Today", //day
                                  minTemp, //min temperature
                                  maxTemp, //max temperature
                                  FontAwesomeIcons.cloud, size, isDarkMode,
                                ),
                            ],
                          ),
                        ),
                      ]
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white38 : Colors.black38,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.grey,
          ),
        ],
      ),
    );
  }
}