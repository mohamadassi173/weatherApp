import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherModel {
  static Future<Map> getWeather() async {
    // print('lol');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=5bc1772c2a423134ae5fffbcb6b61f97'));
    Map valueMap = jsonDecode(response.body);
    return valueMap;
    print(valueMap['weather'][0]['description'].toString());
  }
}
