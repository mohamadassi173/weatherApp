import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'weather_model.dart';
import 'week_weather.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel.getWeather();
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(color: Colors.black87),
        ),
        Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: Text(
                "WeatherLens",
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white)),
              width: 80.w,
              child: FutureBuilder(
                  future: WeatherModel.getWeather(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map? value = snapshot.data as Map?;
                      double temp = value!['main']['temp'] - 273.15;

                      return Column(
                        children: [
                          Image.network(
                            "http://openweathermap.org/img/wn/${value['weather'][0]['icon']}@2x.png",
                          ),
                          Text(
                            "${value['weather'][0]['description']}",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Center(
                            child: Text(
                              "${temp.toInt()}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 100.sp),
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text('lol');
                  }),
            ),

            // WeekWeather(),
          ],
        ),
      ]),
    );
  }
}
