import 'package:flutter/material.dart';
import 'package:rf_block/database_services/database_display.dart';
import 'package:rf_block/nfc_services/nfc_listener.dart';
import 'package:rf_block/nfc_services/nfc_transmitter.dart';
import 'location_services/display_location_data.dart';

var nfcListener = NFCListener();
var nfcTransmitter = NFCTransmitter();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RF Block')),


        // a box which displays the output of the database
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Database output:',
              ),
              ValueListenableBuilder(
                valueListenable: result,
                builder: (context, value, child) {
                  return Text(
                    value ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                },
              ),
            ],
          ),
        ),

        // two buttons to get and clear the data
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: <Widget>[

            // Button to get the data from the database
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                // get the data from the database
                String data = await DatabaseDisplay().getData();
                // update the value of the result
                result.value = data;
              },
              tooltip: 'Get data',
              child: const Icon(Icons.get_app),
            ),

            const SizedBox(height: 10),

            // Button to clear the data from the database
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                // clear the data from display
                result.value = '';
              },
              tooltip: 'Clear data',
              child: const Icon(Icons.clear),
            ),

            const SizedBox(height: 10),

            // Button to start the NfcListener
            FloatingActionButton(
              backgroundColor: Colors.yellow,
              onPressed: () {
                // Listen for NFC signals
                nfcListener.listen();
              },
                tooltip: 'Listen for NFC signals',
              child: const Icon(Icons.nfc)
            ),

            const SizedBox(height: 10),

            // Button to start the NfcTransmitter
            FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                // Transmit NFC data
                nfcTransmitter.transmit();
              },
              tooltip: 'Block NFC data',
              child: const Icon(Icons.block),
            ),

            const SizedBox(height: 10),

            // Button to stop the NfcListener and NfcTransmitter
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                // stop listening for NFC signals
                nfcListener.stop();
                // stop transmitting NFC signals
                nfcTransmitter.stop();
              },
              tooltip: 'Stop NFC',
              child: const Icon(Icons.stop),
            ),

            const SizedBox(height: 10),

            // Button to navigate to the DisplayLocationData view
            FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: () {
                // navigate to the DisplayLocationData view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DisplayLocationData(),
                  ),
                  );
                },
              tooltip: 'Locations',
              child: const Icon(Icons.location_on),
            ),

          ],
        ),
      ),
    );
  }
}
