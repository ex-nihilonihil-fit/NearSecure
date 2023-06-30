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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xD7394CD2),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 400,
                  height: 75,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(14),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFF21DC75),
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFF21DC75),
                            icon: Icon(
                              Icons.rss_feed,
                              color: FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24,
                            ),
                            //showLoadingIndicator: true,
                            onPressed: () {
                              // Listen for NFC signals
                              nfcListener.listen();
                            },
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 115,
                            height: 42,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Text(
                                  'NFC Scan',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF21DC75),
                                    fontSize: 22,
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
                                    fontSize: 13,
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
                  width: 400,
                  height: 75,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFEA0C0C),
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: Color(0xFFEA0C0C),
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
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 138,
                            height: 42,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
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
                                EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                                child: Text(
                                  'Start NFC Transmitter',
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
                  width: 400,
                  height: 75,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowIconButton(
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
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Container(
                              width: 112,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1, 10, 0, 0),
                                  child: Text(
                                    'NFC OFF',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.orange,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1, -1),
                              child: Text(
                                'Turn off NFC Services',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  Colors.orange,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Container(
                  width: 400,
                  height: 75,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowIconButton(
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
                                builder: (context) => DisplayLocationData(),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 160,
                            height: 42,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                          ),
                          Container(
                            width: 140,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, -1),
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
                                    fontSize: 13,
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
                  width: 400,
                  height: 75,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).warning,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: FlutterFlowTheme.of(context).warning,
                          icon: Icon(
                            Icons.text_snippet_rounded,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 24,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DisplayLogData()));

                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 85,
                            height: 42,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
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
                            width: 110,
                            height: 17,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Display of Data',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .warning,
                                    fontSize: 13,
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
                  width: 400,
                  height: 240,
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
                  ),
                  alignment: AlignmentDirectional(0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayLogData extends StatelessWidget {
  DisplayLogData({Key? key}) : super(key: key);
  var _output='';
  Future<void> _updateText(data) async {
    String data = await DatabaseDisplay().getData();
    // update the value of the result
    _output = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'NearSecure',
          style: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
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
              width: 400,
              height: 565,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Text(
                '$_output',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Expanded(
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 40,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Color(0xD71E35D8),
                  size: 34,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    ); // Scaffold
  }
}


class DisplayLocationData extends StatelessWidget {
  DisplayLocationData({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'NearSecure',
          style: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
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
              width: 400,
              height: 565,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Text(
                'Location Data',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Expanded(
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 40,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Color(0xD71E35D8),
                  size: 34,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    ); // Scaffold
  }
}
