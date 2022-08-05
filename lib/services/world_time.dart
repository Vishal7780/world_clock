import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
 late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;
  WorldTime({required this.url,required this.location,required this.flag});
  Future<void> getTime() async {
    Response response = await get(Uri.parse(('http://worldtimeapi.org/api/timezone/$url')));
    Map data=jsonDecode(response.body);
    print(data);



    String datetime=data['datetime'].substring(0,23);
    String offset=data['utc_offset'].substring(1,3);




//print(datetime);
//print(offset);
    DateTime now=DateTime.parse(datetime);

    isDayTime=now.hour>6&&now.hour<18?true:false;

    time=DateFormat.jm().format(now);


  }

  }



