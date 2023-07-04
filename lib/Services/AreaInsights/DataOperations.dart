// ignore_for_file: file_names

import 'dart:convert';

class DataOperations{
  String _getMonthAbbreviation(int month) {
    return [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][month];
  }
  List<Content> dataCleaning(String data,String param){
    List<Content> dataObjectsList = []; // list to be returned
    Map<String, dynamic> insightData = json.decode(data);
    Map<String,dynamic> t2mData = insightData['properties']['parameter'][param];

//Type casting map
    Map<String, double> castedMap = {};//empty map

    t2mData.forEach((key, value) {
      castedMap[key] = value.toDouble();
    });
    Map<String, double> updatedMap = {};

    castedMap.forEach((key, value) {
      DateTime date = DateTime.parse('${key.substring(0, 6)}01');
      String formattedKey = "${_getMonthAbbreviation(date.month)}'${date.year.toString().substring(2)}";
      updatedMap[formattedKey] = value;
    });

    updatedMap.forEach((month, temperature) {
      dataObjectsList.add(Content(month,temperature));
    }
    );
    return dataObjectsList;
  }

}
class Content{
  String month;
  double value;
  Content(this.month, this.value);
}



