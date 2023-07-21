import 'database_helper.dart';

// a class which displays the output of the database
class DatabaseDisplay {
  // create a function to get the data from the database
  Future<String> getData() async {
    // get a reference to the database
    var db = DatabaseHelper();
    // get the data from the database
    List<Map> list = await db.rawQuery('SELECT * FROM nfc_events');
    // convert the data to a string
    String output = '';
    for (int i = 0; i < list.length; i++) {
      output += list[i]['rawData'] + ',' + 'Location - ' + list[i]['loc'].toString() + '\n';
    }
    // return the data
    return output;
  }
}
