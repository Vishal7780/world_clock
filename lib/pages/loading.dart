import 'package:flutter/cupertino.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';

  void setupWorldTime() async {
    WorldTime instance=WorldTime(location: 'india',flag: 'india.png',url:'Asia/Kolkata');


    instance.getTime();
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }
    @override

  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(


          child:SpinKitRotatingCircle(

            color: Colors.white,
            size: 50.0,

          ),

      ),

    );
  }
}
