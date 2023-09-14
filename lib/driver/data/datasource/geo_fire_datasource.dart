
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

abstract class IGeoFireDataSource{
  Future<void> registerLocation(String id, double lat, double lng);
  Future<bool> deleteLocation(String id);
}

class GeoFireDataSource extends IGeoFireDataSource{
  
  final _db = FirebaseFirestore.instance; 

  final GeoFlutterFire _geo = GeoFlutterFire();
  
  @override
  Future<void> registerLocation(String id, double lat, double lng) {

    GeoFirePoint myLocation =  _geo.point(latitude: lat, longitude: lng);

    final location = <String, dynamic>{
      "status": "drivers_available",
      "position": myLocation.data,
    };

    return _db.collection('locations').doc(id).set(location);

  }
  
  @override
  Future<bool> deleteLocation(String id) async {
    await _db.collection('locations').doc(id).delete();
    return true;
  } 
  


}
