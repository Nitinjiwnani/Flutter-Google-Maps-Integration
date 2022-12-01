import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/convert_latlng_to_address.dart';
import 'package:flutter_maps/custom_marker_info_window.dart';
import 'package:flutter_maps/custom_marker_screen.dart';
import 'package:flutter_maps/google_places_api.dart';
import 'package:flutter_maps/home_screen.dart';
import 'package:flutter_maps/network_image_marker.dart';
import 'package:flutter_maps/polygon_screen.dart';
import 'package:flutter_maps/polyline.dart';
import 'package:flutter_maps/user_current_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomMarkerWithNetworkImage(),
    );
  }
}
