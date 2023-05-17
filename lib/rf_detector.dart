import 'package:nfc_manager/nfc_manager.dart';
import 'database.dart';

class RfDetector {
  RfRead()  => NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var value = tag.data; // get value from tag
      // place value into database.dart
      await DataBase().insertRecord(value);
    });

  RfStop() {
    NfcManager.instance.stopSession(); // stop reading
  }

  insertRecord(Map<String, dynamic> value) {
    // insert value into database
  }
}