import 'package:flutter/material.dart';
import 'package:rf_block/database_services/database_display.dart';
import 'package:rf_block/nfc_services/nfc_listener.dart';
import 'package:rf_block/nfc_services/nfc_transmitter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'database_services/database_helper.dart';
import 'location_services/display_location_data.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';




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
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(175),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                child: Container(
                  width: 400,
                  height: 105,
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFF21DC75),
                            borderRadius: 22,
                            borderWidth: 1,
                            buttonSize: 50,
                            fillColor: Color(0xFF21DC75),
                            icon: Icon(
                              Icons.rss_feed,
                              color: FlutterFlowTheme.of(context).primaryBtnText,
                              size: 26,
                            ),
                            //showLoadingIndicator: true,
                            onPressed: () {
                              // Listen for NFC signals
                              DatabaseHelper().insert('test data' as String, 35 as int);
                              nfcListener.listen();
                            },
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 400,
                  height: 105,
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 26,
                          ),
                          onPressed: () {
                            // Transmit NFC data
                            nfcTransmitter.transmit();
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 400,
                  height: 105,
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 26,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Container(
                              width: 112,
                              height: 55,
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
                                        .bodyText2
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
                              alignment: AlignmentDirectional(1, -1),
                              child: Text(
                                'Turn off NFC Services',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  Colors.orange,
                                  fontSize: 15,
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
                  height: 105,
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 26,
                          ),
                          onPressed: () {
                            // navigate to the DisplayLocationData view
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DisplayLocation()));
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
                            height: 55,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
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
                  width: 400,
                  height: 105,
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 26,
                          ),
                          onPressed: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DisplayLogData()));

                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 110,
                            height: 59,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1,1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
                                child: Text(
                                  'Logs',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .warning,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 25,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1,1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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

class DisplayLogData extends StatefulWidget {
  DisplayLogData({Key? key}) : super(key: key);

  @override
  State<DisplayLogData> createState() => _DisplayLogData();
}
class _DisplayLogData extends State<DisplayLogData> {

  List<String> _logs = [];
  @override
  initState(){
    _updateLog();
    super.initState();
  }

  Future<void> _updateLog() async {
    String data = await DatabaseDisplay().getData();
    setState((){
      _logs = data.split('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).lineColor,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
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
      body: _logs==null ? Container():ListView.builder(
        itemCount: _logs.length,
        itemBuilder: (_, int position) {
          return Card(
            child: ListTile(
              title:
              Text(_logs[position]),
            ),
          );
        },
      ),
    ); // Scaffold
  }

}

class DisplayLocation extends StatefulWidget {

  DisplayLocation({Key? key}) : super(key: key);
  @override
  _DisplayLocation createState() => _DisplayLocation();
}
class _DisplayLocation extends State<DisplayLocation>  {

  MapController _mController = MapController();
  double _zoom = 10;
  List<LatLng> _latLongList = [
    LatLng(37, -121),
    LatLng(37.02, -121.51),
    LatLng(37.05, -121.53),
    LatLng(37.055, -121.54),
    LatLng(37.059, -121.55),
    LatLng(37.07, -121.55),
    LatLng(37.1, -121.5342),
  ];
  List<Marker> _markerList = [];

  @override
  void initState() {
    _markerList = _latLongList
        .map((point) => Marker(
      point: point,
      width: 60,
      height: 60,
      builder: (context) => Icon(
        Icons.pin_drop,
        size: 60,
        color: Colors.blueAccent,
      ),
    ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).lineColor,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
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
      body: FlutterMap(
        mapController: _mController,
        options: MapOptions(
          center: _latLongList[0],
          bounds: LatLngBounds.fromPoints(_latLongList),
          zoom: _zoom,
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //userAgentPackageName: 'com.example.app',
          ),
          MarkerClusterLayerWidget(options: MarkerClusterLayerOptions(
            maxClusterRadius: 190,
            disableClusteringAtZoom: 16,
            size: Size(50, 50),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: _markerList,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration:
                BoxDecoration(color: Color(0xFF1CA8F1), shape: BoxShape.circle),
                child: Text('${markers.length}'),
              );
            },
          ),)
        ],
      ),
    );
  }
}
