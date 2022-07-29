// Import the test package and Counter class

import 'package:test/test.dart';
import 'package:weatherlens/api/weather_api.dart';

void main() {
  test('Country recognize test', () async {
    Map weather = await WeatherApi.weatherMap(31.0461, 34.8516);

    expect(weather['sys']['country'], "IL");
  });
  test('Longitude and Latitude test', () async {
    Map weather = await WeatherApi.weatherMap(31.0461, 34.8516);

    expect(weather['coord']['lat'], 31.0461);
    expect(weather['coord']['lon'], 34.8516);
  });
}
