import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/exceptions.dart';

abstract class ILocationDataSource{

  Future<Position> getCurrentLocation();

}

class GoogleMapsDataSource extends ILocationDataSource{

  @override
  Future<Position> getCurrentLocation() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.
      // return Future.error('El servicio de GPS esta desactivado.');
      return Future.error(LocationException('El servicio de GPS esta desactivado.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(LocationException('Se deniegan los permisos de ubicación'));
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error( LocationException('Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.'));
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();

  }

}
