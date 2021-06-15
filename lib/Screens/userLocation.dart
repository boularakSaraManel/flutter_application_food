import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class userLocation extends StatefulWidget {
  @override
  _userLocationState createState() => _userLocationState();
}

class _userLocationState extends State<userLocation> {
  var locationMessage="";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat= position.latitude;
    var long= position.longitude; 
    print ("$lat, $long");

    setState(() {
      locationMessage = "Latitude : $lat , Longitude : $long";      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Services")
      ),      
      body : Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: 46.0,
            color: Colors.blue
            ),
          SizedBox(height:10.0,),
          Text("Get user Location",
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
          height: 20.0,
          ),
          Text("Position : $locationMessage"),
          //FlatButton(onPressed: onPressed, child: child),
          TextButton(
            onPressed: () {
               getCurrentLocation();
             },
            child: Text('Get current location'),
            
          )
          
        ],
      ),
      )
    );
  }
}


