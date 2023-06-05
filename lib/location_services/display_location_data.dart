import 'package:flutter/material.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

var databaseHelper = DatabaseHelper();

// get the location data from the database and display it on a page with a map
class DisplayLocationData extends StatefulWidget {

  const DisplayLocationData({super.key});
  @override
  DisplayLocationDataState createState() => DisplayLocationDataState();
}

class DisplayLocationDataState extends State<DisplayLocationData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RF Block')),
      body: displayLocationData(),
    );
  }
  // display the location data on a map
  Widget displayLocationData() {
    return FutureBuilder(
      future: getLocationData(),
      builder: (BuildContext context, AsyncSnapshot<List<LatLng>> snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: snapshot.data![0],
              zoom: 11.0,
            ),
            markers: Set<Marker>.of(
              snapshot.data!.map(
                    (LatLng location) {
                  return Marker(
                    markerId: MarkerId(location.toString()),
                    position: location,
                  );
                },
              ),
            ),
          );
        } else {
          return const Text('No data');
        }
      },
    );
  }

  // get the location data from the database
  Future<List<LatLng>> getLocationData() async {
    // get the data from the database
    List<Map> list = await databaseHelper.rawQuery('SELECT * FROM nfc_events');
    List<LatLng> locations = [];
    // convert the data to a list of LatLng objects
    for (int i = 0; i < list.length; i++) {
      locations.add(LatLng(list[i]['lat'], list[i]['lng']));
    }
    // return the data
    return locations;
  }
}