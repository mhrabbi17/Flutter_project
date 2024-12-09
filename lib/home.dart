import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:google_maps/real_time_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleMaps()),
                  );
                },
                child: Text('Google Maps')
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RealTimeLocation()),
                  );
                },
                child: Text('Real Time Location')
            ),
          ],
        ),
      ),
    );
  }
}
