import 'database_helper.dart';

// a class which displays the output of the database
class DatabaseDisplay {
  // create a function to get the data from the database
  Future<String> getData() async {
    // get a reference to the database
    var db = DatabaseHelper();
    // get the data from the database
    List<Map> list = await db.queryTimeIdNfcData();
    //convert the data to a string
    String output = '';
    for (int i = 0; i < list.length; i++) {
       output = '$output${list[i]}\n';
      }
    print('output: $output');
    //return the data
    return output;
  }
}
