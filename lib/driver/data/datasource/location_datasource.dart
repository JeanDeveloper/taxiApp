import 'dart:async';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi/app/core/errors/exceptions.dart';

abstract class ILocationDataSource{
  Future<Position> getCurrentLocation();
}

class GoogleMapsDataSource extends ILocationDataSource{

  Future<Position> _determinePosition() async {

    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<Position> getCurrentLocation() async {

    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if( serviceEnabled ){
      final  position = await _determinePosition();
      return position;
    }else{

      bool locationGPS = await Location().requestService();

      if(locationGPS){
        final  position = await _determinePosition();
        return position;
      }else{
        return Future.error(LocationException('Ha denegado la peticion del GPS'));
      }

    }



  }

}
