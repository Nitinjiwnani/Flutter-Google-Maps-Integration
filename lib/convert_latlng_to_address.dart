import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatlangToAddress extends StatefulWidget {
  const ConvertLatlangToAddress({super.key});

  @override
  State<ConvertLatlangToAddress> createState() =>
      _ConvertLatlangToAddressState();
}

class _ConvertLatlangToAddressState extends State<ConvertLatlangToAddress> {
  String stAddress = '', stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          Text(stAdd),
          GestureDetector(
            onTap: () async {
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(52.2165157, 6.9437819);

              // final coordinates = new Coordinates(24.5854, 73.7125);

              setState(() {
                stAddress = locations.last.longitude.toString() +
                    " " +
                    locations.last.longitude.toString();
                stAdd = placemarks.reversed.last.country.toString() +
                    " " +
                    placemarks.reversed.last.locality.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
