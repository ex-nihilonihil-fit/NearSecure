import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:rf_block/nfc_services/random_data.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCTransmitter {
  get urlRecords => null;

void transmit() {
  var randomNumber = RandomData().getRandom32Bits();
  // write the random string to the tag
  //await FlutterNfcKit.writeNDEFRecords([ndef.UriRecord.fromString(randomNumber.toString())]);
  // handle the PlatformException error since the tag isn't formatted and the write will fail
  try {
    FlutterNfcKit.writeNDEFRecords(
        [ndef.UriRecord.fromString(randomNumber.toString())]);
  } on PlatformException catch (e) {
    print('Error: $e'); //TODO: Remove this line
  }
}

  // close the session
  Future<void> stop() async {
    await FlutterNfcKit.finish();
  }
}
