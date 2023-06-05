import 'package:nfc_manager/nfc_manager.dart';
import 'package:rf_block/nfc_services/random_data.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'package:rf_block/location_services/location_data.dart';
import 'dart:async';

class NFCTransmitter {
  final NfcManager _nfcManager = NfcManager.instance;

  Future<void> transmit() async {
      // Start the session
      await _nfcManager.startSession(
        onDiscovered: (NfcTag tag) async {
          // Create an instance of Ndef
          Ndef? ndef = Ndef.from(tag);

          if (ndef == null) { // If the tag is not compatible with NDEF
            print('Tag is not compatible with NDEF'); //TODO: Remove this line
            return;
          }

          // Write the data to the tag (send a signal)
          await ndef.write(NdefMessage([
            // write a random 32 bit number to the tag
            NdefRecord.createText(RandomData().getRandom32Bits().toString())
          ]));

          // Read the data from the tag
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