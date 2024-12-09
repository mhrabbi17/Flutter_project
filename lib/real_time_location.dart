import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RealTimeLocation extends StatefulWidget {
  const RealTimeLocation({super.key});

  @override
  State<RealTimeLocation> createState() => _RealTimeLocationState();
}

class _RealTimeLocationState extends State<RealTimeLocation> {
  Position? position;
  @override
  void initState() {
    super.initState();
    listenCurrentLocation();
  }
  Future<void> listenCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if(isGranted){
      final isServiceEnabled = await checkGPSServiceEnable();
      if(isServiceEnabled){
        Geolocator.getPositionStream(
          locationSettings: LocationSettings(
            timeLimit: Duration(seconds: 10),
            accuracy: LocationAccuracy.bestForNavigation
          )
        ).listen((pos) {
          print(pos);
        });
      }
      else{
        Geolocator.openLocationSettings();
      }
    }
    else{
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      }
      else{
        Geolocator.openAppSettings();
      }
    }
  }
  Future<void> getCurrentLocation()async {
    final isGranted = await isLocationPermissionGranted();
    if(isGranted){
      final isServiceEnabled = await checkGPSServiceEnable();
      if(isServiceEnabled){
        Position p = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(timeLimit: Duration(seconds: 10))
        );
        position = p;
        setState(() {});
      }
      else{
        Geolocator.openLocationSettings();
      }
    }
    else{
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      }
      else{
        Geolocator.openAppSettings();
      }
    }
  }
  Future<bool> isLocationPermissionGranted() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> requestLocationPermission() async{
    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      return true;
    }
    else{
      return false;
    }
  }
  Future<bool> checkGPSServiceEnable() async{
    return await Geolocator.isLocationServiceEnabled();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Location Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Current Location: ${position}'),
            ElevatedButton(
                onPressed: (){
                  getCurrentLocation();
                  },
                child: Text('Current Location')
            )
          ],
        )
        
      ),
    );
  }
}
