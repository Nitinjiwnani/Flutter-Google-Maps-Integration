import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14.4746,
  );
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: 'My Position')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.738045, 73.084488),
        infoWindow: InfoWindow(title: 'e-11 Sector')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(35.6762, 139.6503),
        infoWindow: InfoWindow(title: 'Tokyo japan'))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(35.6762, 139.6503), zoom: 14)));
          setState(() {});
        },
      ),
    );
  }
}
