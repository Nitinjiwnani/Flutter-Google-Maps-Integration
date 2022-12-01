import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({super.key});

  @override
  State<PolygoneScreen> createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.654235, 73.073000), zoom: 14);

  final Set<Marker> _markers = {};
  Set<Polygon> _polygone = HashSet<Polygon>();
  List<LatLng> points = [
    LatLng(33.654235, 73.073000),
    LatLng(33.647326, 72.820175),
    LatLng(33.689531, 72.763160),
    LatLng(34.131452, 72.662334),
    LatLng(33.654235, 73.073000)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygone.add(Polygon(
        polygonId: PolygonId('1'),
        points: points,
        fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polygone')),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        polygons: _polygone,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
