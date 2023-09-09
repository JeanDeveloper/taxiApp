import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ButtonPositionCurrent extends StatelessWidget {

  Completer<GoogleMapController> gmcontroller;

  ButtonPositionCurrent({super.key, required this.gmcontroller});


  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-9.084479755169513, -78.57767754372975),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topRight,
        margin: const EdgeInsets.all(20),
        child: IconButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder()),
          ),
          onPressed: () => _goToCurrentPosition, 
          icon: const Icon(Icons.gps_fixed_outlined, size: 35),
        )
    
      ),
    );
  }

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await gmcontroller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

}