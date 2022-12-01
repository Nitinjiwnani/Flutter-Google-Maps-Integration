import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineScreen extends StatefulWidget {
  const PolyLineScreen({super.key});

  @override
  State<PolyLineScreen> createState() => _PolyLineScreenState();
}

class _PolyLineScreenState extends State<PolyLineScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(24.577974, 73.723881), zoom: 14);

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLine = {};

  List<LatLng> latLng = [
    LatLng(24.577974, 73.723881),
    LatLng(24.581034, 73.717657),
    LatLng(24.579435, 73.708997),
    LatLng(24.579451, 73.697027),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < latLng.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: latLng[i],
          infoWindow:
              InfoWindow(title: 'Really cool place', snippet: '5 star rating'),
          icon: BitmapDescriptor.defaultMarker));
      setState(() {});
      _polyLine.add(Polyline(
          polylineId: PolylineId('1'), points: latLng, color: Colors.orange));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PolyLine'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        polylines: _polyLine,
        mapType: MapType.normal,
        myLocationEnabled: true,
      ),
    );
  }
}
