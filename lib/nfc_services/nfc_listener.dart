import 'dart:convert';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCListener {
// start an asynchronous session to listen for NFC tags
  Future<void> listen() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      //display the error
      print('NFC is not available on this device'); //TODO: Remove this line
    } else {
      print('NFC listener started'); //TODO: Remove this line
    }

    var tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 240));
    var id = tag.id;
    print('NFC ID: $id'); //TODO: Remove this line
    var nfcData = '${tag.type}, ${tag.sak}, ${tag.atqa}';
    print('NFC Data: $nfcData'); //TODO: Remove this line

    // get the current location
    var location = await LocationData().getLocation();
    // convert the Position location to two doubles
    print('location: $location'); //TODO: Remove this line

    // get the current time without seconds and milliseconds
    var time = DateTime.now().toString().substring(0, 16);
    print('time: $time'); //TODO: Remove this line
    // Write the data to the database.
    DatabaseHelper().insert(time, id, nfcData, location);
  }

  // close the session
  Future<void> stop() async {
    await FlutterNfcKit.finish();
    print('Session closed'); //TODO: Remove this line
  }

}