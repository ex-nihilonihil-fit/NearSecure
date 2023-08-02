import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:rf_block/database_services/database_display.dart';
import 'package:rf_block/location_services/display_location_data.dart';
import 'package:rf_block/nfc_services/nfc_listener.dart';
import 'package:rf_block/nfc_services/nfc_transmitter.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';


var nfcListener = NFCListener();
var nfcTransmitter = NFCTransmitter();
List<LatLng> locationsList =  [];

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
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).lineColor,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2,5,2,5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            centerTitle: false,
          ),
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                child: Container(
                  width: 390,
                  height: 92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(14),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFF21DC75),
                          borderRadius: 22,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: Color(0xFF21DC75),
                          icon: Icon(
                            Icons.rss_feed,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 26,
                          ),

                          onPressed: () {
                            // Listen for NFC signals
                            nfcListener.listen();
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text("NFC Listener Started"),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 125,
                            height: 55,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 15, 0, 0),
                                child: Text(
                                  'NFC Scan',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF21DC75),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 18,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, -1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 2),
                                child: Text(
                                  'Listen for NFC signals',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF21DC75),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 390,
                  height: 92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFEA0C0C),
                          borderRadius: 22,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: Color(0xFFEA0C0C),
                          icon: Icon(
                            Icons.block,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 26,
                          ),
                          onPressed: () {
                            // Transmit NFC data
                            nfcTransmitter.transmit();
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text("NFC Transmitter Started"),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 138,
                            height: 55,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'NFC Block',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFEA0C0C),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                                child: Text(
                                  'Start NFC Transmitter',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFEA0C0C),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 390,
                  height: 92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.orange,
                          borderRadius: 22,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: Colors.orange,
                          icon: Icon(
                            Icons.stop_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 26,
                          ),
                          onPressed: () {
                            // stop listening for NFC signals
                            nfcListener.stop();
                            // stop transmitting NFC signals
                            nfcTransmitter.stop();
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text("NFC Services turned OFF"),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Container(
                              width: 112,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 10, 0, 0),
                                  child: Text(
                                    'NFC OFF',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.orange,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Turn off NFC Services',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.orange,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 390,
                  height: 92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFD21CF1),
                          borderRadius: 22,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: Color(0xFFD21CF1),
                          icon: Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 26,
                          ),
                          onPressed: () async {
                            locationsList =  await DatabaseDisplay().getLocation() as List<LatLng>;
                            if(locationsList.length == 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  NoDataDisplay()));
                            } else {
                              // navigate to the DisplayLocationData view
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  DisplayLocation()));
                            }
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 168,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(13, 0, 0, 0),
                                child: Text(
                                  'Location Data',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFD21CF1),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 165,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1, -1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  'Location Data Display',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFD21CF1),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 390,
                  height: 92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).warning,
                          borderRadius: 22,
                          borderWidth: 1,
                          buttonSize: 50,
                          fillColor: FlutterFlowTheme.of(context).warning,
                          icon: Icon(
                            Icons.text_snippet_rounded,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DisplayLogData()));
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Container(
                              width: 110,
                              height: 55,
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
                                    color: FlutterFlowTheme.of(context)
                                        .warning,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                                child: Text(
                                  'Display of Data',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .warning,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
