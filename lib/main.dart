import 'package:flutter/material.dart';
import 'package:rf_block/database_services/database_display.dart';
import 'package:rf_block/nfc_services/nfc_listener.dart';
import 'package:rf_block/nfc_services/nfc_transmitter.dart';
import 'location_services/display_location_data.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';


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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xD7394CD2),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1, -1),
            child: Text(
              'Near Secure',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 403,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 15,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: const Color(0xFF21DC75),
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        fillColor: const Color(0xFF21DC75),
                        icon: Icon(
                          Icons.rss_feed,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 24,
                        ),
                        //showLoadingIndicator: true,
                        onPressed: () async {
                          // Listen for NFC signals
                          nfcListener.listen();
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 115,
                          height: 48,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1, 1),
                            child: Text(
                              'NFC Scan',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF21DC75),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 18,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(1, 0),
                            child: Text(
                              'Listen for NFC signals',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF21DC75),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 403,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 15,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: const Color(0xFFEA0C0C),
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: const Color(0xFFEA0C0C),
                      icon: Icon(
                        Icons.block,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24,
                      ),
                      onPressed: () {
                        // Transmit NFC data
                        nfcTransmitter.transmit();
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 138,
                          height: 45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1, 1),
                            child: Text(
                              'NFC Block',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFFEA0C0C),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 159,
                          height: 17,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: Text(
                              'start the NFC Transmitter',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFFEA0C0C),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 403,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 15,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.orange,
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: Colors.orange,
                      icon: Icon(
                        Icons.stop_rounded,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24,
                      ),
                      onPressed: () {
                        // stop listening for NFC signals
                        nfcListener.stop();
                        // stop transmitting NFC signals
                        nfcTransmitter.stop();
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 112,
                          height: 45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 1),
                            child: Text(
                              'NFC OFF',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.orange,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 17,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Text(
                              'Turn off NFC Services',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.orange,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 403,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 15,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Color(0xFFD21CF1),
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: Color(0xFFD21CF1),
                      icon: Icon(
                        Icons.location_on,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24,
                      ),
                      onPressed: () {
                        // navigate to the DisplayLocationData view
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DisplayLocationData(),
                          ),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 160,
                          height: 45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Text(
                              'Location Data',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFFD21CF1),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 135,
                          height: 17,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Text(
                              'Location Data Display',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFFD21CF1),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 403,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 15,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.yellow,
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: Colors.yellow,
                      icon: Icon(
                        Icons.text_snippet_rounded,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 24,
                      ),
                      onPressed: () async {
                        // get the data from the database
                        String data = await DatabaseDisplay().getData();
                        // update the value of the result
                        result.value = data;
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 85,
                          height: 45,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 1),
                            child: Text(
                              'Logs',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.yellow,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 17,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Text(
                              'Display of Data',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                fontFamily: 'Outfit',
                                color: Colors.yellow,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
