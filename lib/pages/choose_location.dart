import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:world_clock/services/world_time.dart';
class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  Choose_locationState createState() => Choose_locationState();
}

class Choose_locationState extends State<Choose_location> {
  List<WorldTime> locations = [
  WorldTime(url: 'Europe/London', location: 'London', flag: 'england.png'),
  WorldTime(url: 'Asia/Karachi', location: 'pakistan', flag: 'pakistan.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'sri_lanka.png'),
  WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'Bangkok.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Korea', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'INDIA', flag: 'india.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'Bangladesh.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'Los_Angeles.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Asia/Macau', location: 'China', flag: 'china.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'australia.png'),
    WorldTime(url: 'Australia/Perth', location: 'perth', flag: 'australia.png'),
    WorldTime(url: 'Asia/Dubai', location:'Dubai', flag: 'dubai.png'),
    WorldTime(url: 'America/New_York', location: 'New york', flag: 'Los_Angeles.png'),



  ];
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Choose location',
          style: TextStyle(

          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,

        itemBuilder: (context,index){
          return Card(
          child: ListTile(
            iconColor: Colors.grey,
            onTap: (){
              print(locations[index].location);
              updateTime(index);
            },
              title:Text(locations[index].location,

                style: TextStyle(
                  color: Colors.black,
                ),


              ),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/${locations[index].flag}',


              ),
            ),

          )
          );
      }

      ),



    );
  }
}
