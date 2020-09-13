import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _mapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    final position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(position.latitude, position.longitude))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Finder"),
      ),
      body: Stack(
        children: [
          GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: _mapCreated,
              initialCameraPosition: CameraPosition(
                  target: LatLng(3.138270, 101.608050), zoom: 20)),
        ],
      ),
    );
  }
}
