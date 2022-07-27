import 'package:geolocator/geolocator.dart';

class LocationService {
  late double latitude;
  late double longitude;

  // Constructor
  // WeatherApi(this.latitude, this.longitude);
  // Get Geo location and update position latitude and longitude
  Future<void> updatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
