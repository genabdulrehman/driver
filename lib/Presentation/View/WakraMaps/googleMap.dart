import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapLocation extends StatefulWidget {
  @override
  State<GoogleMapLocation> createState() => GoogleMapLocationState();
}

class GoogleMapLocationState extends State<GoogleMapLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static const Marker market1 = Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(25.27792923581628, 51.52404604667656),
    infoWindow: InfoWindow(title: 'Metro Station', snippet: 'Doha'),
  );
  static final Marker market2 = Marker(
      markerId: const MarkerId('id-1'),
      position: const LatLng(25.28086380839513, 51.515127998060045),
      infoWindow: const InfoWindow(title: 'Freej', snippet: 'Doha'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

  static final Polyline _polyline = Polyline(
      polylineId: PolylineId("_polyline"),
      width: 5,
      color: AppColors.redColor,
      points: [
        LatLng(25.27792923581628, 51.52404604667656),
        LatLng(25.28086380839513, 51.515127998060045),
      ]);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      polylines: {
        _polyline,
      },
      initialCameraPosition: const CameraPosition(
          target: LatLng(25.28086380831628, 51.515127998060045), zoom: 14),
      markers: {market1, market2},
    );
  }
}
