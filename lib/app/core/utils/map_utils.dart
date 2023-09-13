import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils{

  static Future<BitmapDescriptor> createMarketImageFromAsset(String path) async {
    ImageConfiguration conf = const ImageConfiguration();
    BitmapDescriptor bitmapDescription = await BitmapDescriptor.fromAssetImage(conf, path);
    return bitmapDescription;  
  }
}