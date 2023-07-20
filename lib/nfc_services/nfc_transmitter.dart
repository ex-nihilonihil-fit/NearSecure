import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:rf_block/nfc_services/random_data.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCTransmitter {
  get urlRecords => null;


  Future<void> transmit() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      print('NFC is not available on this device');
      return;
    }
    // listen for any tag and get the tag data when it's tapped.
    var tag = await FlutterNfcKit.poll(androidCheckNDEF: false);
    print('data: $tag'); //TODO: Remove this line

    // if a tag is found, write random data to it
    var randomNumber = RandomData().getRandom32Bits();
    // write the random string to the tag
    await FlutterNfcKit.writeNDEFRecords([ndef.UriRecord.fromString(randomNumber.toString())]);
    print('random number: $randomNumber written to tag'); //TODO: Remove this line
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