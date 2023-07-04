// ignore_for_file: file_names

import 'package:http/http.dart' as http;
class APIServices{
  static Future<String> fetchInsightData()async{
    const String nasaPowerUrl = 'https://power.larc.nasa.gov/api/temporal/monthly/point?parameters=ALLSKY_SRF_ALB,CLRSKY_SFC_SW_DWN,ALLSKY_SFC_SW_DWN,T2M,PRECTOTCORR,WD50M,WS50M&community=RE&longitude=73.6915&latitude=24.5854&format=JSON&start=2020&end=2020';
    final insightResponse =await http.get(Uri.parse(nasaPowerUrl));
    return insightResponse.body;
  }
}