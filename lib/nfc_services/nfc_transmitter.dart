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
      //display the error
      print('NFC is not available on this device'); //TODO: Remove this line
    } else {
      print('NFC listener started'); //TODO: Remove this line
    }
    // listen for any tag and get the tag data when it's tapped.
    var tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 240));
    var id = tag.id;
    print('NFC ID: $id'); //TODO: Remove this line
    var nfcData = '${tag.type}, ${tag.sak}, ${tag.atqa}';
    print('NFC Data: $nfcData'); //TODO: Remove this line

    // if a tag is found, write random data to it
    var randomNumber = RandomData().getRandom32Bits();
    // write the random string to the tag
    await FlutterNfcKit.writeNDEFRecords([ndef.UriRecord.fromString(randomNumber.toString())]);
    print('random number: $randomNumber written to tag'); //TODO: Remove this line

    // get the current location
    var location = await LocationData().getLocation();
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
  }
}