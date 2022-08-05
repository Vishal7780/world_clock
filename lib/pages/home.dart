import 'package:flutter/material.dart';
import 'package:world_clock/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDayTime']?'day.png':'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.lightBlue : Colors.indigo[700];
    return  Scaffold(
      backgroundColor:bgColor,


      body: SafeArea(
       child:Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/$bgImage'),
             fit:BoxFit.cover,
           )
         ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 120,0,0),
           child: Column(
              children: <Widget>[

                FlatButton.icon(

                    onPressed:()async{


         dynamic result=await Navigator.pushNamed(context,'/location');
         setState(() {
         data={
         'time':result['time'],
         'location':result['location'],
         'isDayTime':result['isDayTime'],
         };
         });

         },
                  icon: Icon(
                      Icons.edit_location,
                  size: 30,
                    color: Colors.white,
                  ),
                  label: Text(
                      'Edit location',
                    style:TextStyle(
                      fontSize: 35,
                      color: Colors.white,

                    )


                  ),


      ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(

                    data['location'],
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      letterSpacing: 2
                    ),

                  ),
    ],
                ),
                SizedBox(height: 20,),
                Text(

                 data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,

                  ),

                ),


              ],




           ),
         ),
       )
    )
    );
  }
}
