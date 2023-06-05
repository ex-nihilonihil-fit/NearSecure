import 'package:nfc_manager/nfc_manager.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCListener {
  final NfcManager _nfcManager = NfcManager.instance;

  Future<void> listen() async {
    // Start listening for NFC signals.
    _nfcManager.startSession(
      onDiscovered: (NfcTag tag) async {
        Ndef? ndef = Ndef.from(tag);

        if (ndef == null) { // if the tag is not compatible with NDEF
          print('Tag is not compatible with NDEF'); //TODO: remove this line
          return;
        }

        // read the data from the tag
        var data = await ndef.read();
        // Get the location data.
        var location = await LocationData().getLocation();
        // Write the data to the database.
        DatabaseHelper().insert(data as String, location as int);
      },
    );
  }

  void stop() async {
    // Close the session
    _nfcManager.stopSession();
  }

}