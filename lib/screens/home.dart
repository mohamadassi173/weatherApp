import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherlens/service/location.dart';
import '../api/weather_api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  LocationService location = LocationService();

  @override
  Widget build(BuildContext context) {
    location.updatePosition;
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
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
                  future: WeatherApi.weatherMap(
                      location.latitude, location.longitude),
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
                    return const Text('error');
                  }),
            ),
          ],
        ),
      ]),
    );
  }
}
