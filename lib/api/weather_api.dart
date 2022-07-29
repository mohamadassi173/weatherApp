import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  // Get weather using "openweathermap" api
  static Future<Map> weatherMap(double latitude, double longitude) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=5bc1772c2a423134ae5fffbcb6b61f97'));
    Map valueMap = jsonDecode(response.body);
    return valueMap;
  }
}
