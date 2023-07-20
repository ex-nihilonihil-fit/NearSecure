import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCListener {

  Future<void> listen() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      print('NFC is not available on this device');
      return;
    }
    // listen for any tag and get the tag data when it's tapped.
    var tag = await FlutterNfcKit.poll(androidCheckNDEF: false);
    print('data: $tag'); //TODO: Remove this line
    // Get the location data.
    var location = await LocationData().getLocation();
    print('location: $location'); //TODO: Remove this line
    // Write the data to the database.
    DatabaseHelper().insert(tag as String, location as int);
  }

  // close the session
  Future<void> stop() async {
    await FlutterNfcKit.finish();
  }
}