import 'package:flutter/material.dart';
import 'package:rf_block/database_services/database_helper.dart';
import 'dart:async';
import 'package:rf_block/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:url_launcher/url_launcher.dart';

var databaseHelper = DatabaseHelper();


class DisplayLocation extends StatefulWidget {

  DisplayLocation({Key? key}) : super(key: key);
  @override
  _DisplayLocation createState() => _DisplayLocation();
}
class _DisplayLocation extends State<DisplayLocation>  {

  List<LatLng> locations = [LatLng(37.354107, -121.955238)];
  MapController _mController = MapController();
  List<Marker> _markerList = [];

  Future<List<LatLng>> getLocation() async {
    // get the data from the database
    List<Map> list = await databaseHelper.queryLoc();
    String data = '';
    List<String> locs = [];
    // convert the data to a list of LatLng objects
    for (int i = 0; i < list.length; i++) {
      data = '$data${list[i]}\n';
    }
    locs = data.split('\n');
    for (int j = 0; j < (locs.length - 1); j++) {
      List<String> temp = locs[j].split(' ');
      locations.add(LatLng(double.parse(temp[1]), double.parse(temp[2].replaceAll('}', ''))));
    }

    locations.removeAt(0);
    // return the data
    return locations;
  }

  @override
  void initState() {
    getLocation();
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
                    'images/location.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            centerTitle: false,
          ),
        ),
        body: displayLocationData()
    );
  }
  Widget displayLocationData() {
    return FutureBuilder(
      future: getLocation(),

      builder: (BuildContext context, AsyncSnapshot<List<LatLng>> snapshot) {
        if (snapshot.hasData) {
          return FlutterMap(
            mapController: _mController,
            options: MapOptions(
              center: snapshot.data![0],
              bounds: LatLngBounds.fromPoints(snapshot.data!),
              zoom: 1.0,
            ),
            children: [
              TileLayer(
                minZoom: 2,
                maxZoom: 18,
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
                markers: locations.map((point) => Marker(
                  point: point,
                  width: 60,
                  height: 60,
                  builder: (context) => Icon(
                    Icons.pin_drop,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                )).toList(),
                polygonOptions: PolygonOptions(
                    borderColor: Colors.blueAccent,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                builder: (context, markers) {
                  return Container(
                    alignment: Alignment.center,
                    decoration:
                    BoxDecoration(color: Color(0xFF1CA8F1), shape: BoxShape.circle),
                    child: Text('${markers.length-1}'),
                  );
                },
              ),)
            ],
          );
        } else {
          return FlutterMap(
            mapController: _mController,
            options: MapOptions(
              center: LatLng(37.354107, -121.955238),
              zoom: 1.0,
            ),
            children: [
              TileLayer(
                minZoom: 2,
                maxZoom: 18,
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                //userAgentPackageName: 'com.example.app',
              ),
            ],
          );
        }
      },
    );
  }
}

class NoDataDisplay extends StatefulWidget {

  NoDataDisplay({Key? key}) : super(key: key);
  @override
  _NoDataDisplay createState() => _NoDataDisplay();
}
class _NoDataDisplay extends State<NoDataDisplay>  {

  MapController _mController = MapController();

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
                    'images/location.png',
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
            center: LatLng(37.354107, -121.955238),
            zoom: 9.0,
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
              minZoom: 2,
              maxZoom: 18,
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              //userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
    );
  }

}
