import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/home.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'WeatherLens',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      );
    });
  }
}
