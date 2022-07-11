import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherlens/providers/weather_provider.dart';
import 'package:weatherlens/weather_model.dart';

class WeekWeather extends StatelessWidget {
  const WeekWeather({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel.getWeather();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white)),
                  height: 30.h,
                  width: 40.w,
                  child: FutureBuilder(
                      future: WeatherModel.getWeather(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map? value = snapshot.data as Map?;

                          return Column(
                            children: [
                              Text("${value!['weather'][0]['description']}"),
                              Image.network(
                                  "http://openweathermap.org/img/wn/${value['weather'][0]['icon']}@2x.png"),
                            ],
                          );
                        }
                        return const Text('lol');
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
