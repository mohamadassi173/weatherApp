import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherlens/providers/weather_provider.dart';
import 'package:sizer/sizer.dart';
import 'home.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: const MyApp(),
    ),
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
        home: const Home(),
      );
    });
  }
}
