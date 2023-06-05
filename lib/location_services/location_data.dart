import 'package:geolocator/geolocator.dart';

class LocationData {
  final Geolocator geolocator = Geolocator();

  Future<Position> getLocation() async {
    // Get the current location of the user.
    var location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Return the location data.
    return location;
  }
}