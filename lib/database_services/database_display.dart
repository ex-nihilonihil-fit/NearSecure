import 'package:latlng/latlng.dart';

import 'database_helper.dart';
import 'package:flutter/material.dart';
import 'package:rf_block/flutter_flow/flutter_flow_theme.dart';


// a class which displays the output of the database
class DatabaseDisplay {
  // create a function to get the data from the database
  Future<String> getData() async {
    // get a reference to the database
    var db = DatabaseHelper();
    // get the data from the database
    List<Map> list = await db.queryTimeLocNfcData();
    //convert the data to a string
    String output = '';
    for (int i = 0; i < list.length; i++) {
       output = '$output${list[i]}\n';
      }

    //return the data
    return output;
  }

  Future<List<LatLng>> getLocation() async {
    List<LatLng> locations = [];
    var db = DatabaseHelper();
    // get the data from the database
    List<Map> list = await db.queryLoc();
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

    // return the data
    return locations;
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
                  'images/logs.png',
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
