import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsShort extends StatefulWidget {
  const GoogleMapsShort({super.key});

  @override
  State<GoogleMapsShort> createState() => _GoogleMapsShortState();
}

class _GoogleMapsShortState extends State<GoogleMapsShort> {
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(37, -122), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map  Position")),
      body: GoogleMap(initialCameraPosition: _kGooglePlex),
    );
  }
}
