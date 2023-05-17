import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart'; // https://pub.dev/packages/nfc_manager
import 'package:rf_block/rf_detector.dart';

import 'database.dart';
import 'rf_detector.dart';
import 'rf_transmitter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('RF Detector')),
        body: SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) =>
            ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(border: Border.all()),
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        // set the value of result to display the database value
                        builder: (context, value, _) =>
                            Text('${value ?? ''}'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    padding: EdgeInsets.all(4),
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: [
                      ElevatedButton(
                          child: Text('RF Read'),
                          onPressed: () {
                            RfDetector().RfRead();
                            result.value = DataBase().getRecords();
                          }),

                      ElevatedButton(
                          child: Text('RF Block'),
                          onPressed: () {
                            RfBlock().RfWrite();
                            result.value = DataBase().getRecords();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
