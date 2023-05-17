import 'dart:math';
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:typed_data';

class RfBlock {
  RfWrite() => NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        NfcManager.instance.stopSession();
        return;
      }

      // create a random string
      var random = Random.secure();
      var value = List<int>.generate(16, (i) => random.nextInt(256));

      NdefMessage message = NdefMessage([
        NdefRecord.createMime('text/plain', Uint8List.fromList(value)), // write the random string to the tag
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        NfcManager.instance.stopSession();
      } catch (e) {
        NfcManager.instance.stopSession();
        return;
      }
    });

  RfStop() {
    NfcManager.instance.stopSession(); // stop reading
  }
}