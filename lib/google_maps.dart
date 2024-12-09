import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goolge Maps"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(
              22.461021367767824, 91.97084960840553
          ),
        ),
        onTap: (LatLng? latlng){
          print(latlng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        trafficEnabled: true,
        markers: <Marker>{
           Marker(
            markerId: MarkerId('Home'),
            position: LatLng(
                22.460111846623857,
                91.96948405355215
            ),
            infoWindow: InfoWindow(
              title: 'My current location',
              onTap: () {
                print("On Tapped Home");
              },
            ),
             icon: BitmapDescriptor.defaultMarkerWithHue(
               BitmapDescriptor.hueGreen
             ),
             draggable: true,
             onDragStart: (LatLng onStartLatLng){
              print('On Start drag ${onStartLatLng}');
             },
             onDragEnd: (LatLng onEndLatLng){
               print('On Start drag ${onEndLatLng}');
             },
          ),

        },
        circles: <Circle>{
          const Circle(
            circleId: CircleId('Initial-circle'),
            fillColor: Colors.red,
            center: LatLng(22.45987122950056,91.97162208460593),
            radius: 300,
            strokeColor: Colors.blue,
            strokeWidth: 1,
            visible: true,
          )
        },
        polylines: <Polyline>{
          const Polyline(
            polylineId: PolylineId('random'),
            color: Colors.green,
            width: 3,
            points: <LatLng>[
              LatLng(22.458078015690145, 91.96731884032488),
              LatLng(22.465020618168886, 91.96903545409441)
            ]
          ),
        },
        polygons: <Polygon>{
          const Polygon(
              polygonId: PolygonId("Poly-ID"),
              points: <LatLng>[
                LatLng(22.457787377449367, 91.96529310196638),
                LatLng(22.4634228000505, 91.96400966495275),
                LatLng(22.45870886589405, 91.96187630295753),
                LatLng(22.461806063256798, 91.96145117282867)
              ]
          )
        },
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(
                            22.4634228000505,
                            91.96400966495275
                        )
                    )
                )
            );
          },
          child: const Icon(Icons.location_history),
      ),
    );
  }
}
