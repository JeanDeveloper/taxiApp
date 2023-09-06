
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi/driver/data/models/color_vehicle_model.dart';
import 'package:taxi/driver/data/models/model_vehicle_model.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';

abstract class IRegisterDataSource{

  Future<List<ModelVehicle>> getModels();
  Future<List<ColorVehicle>> getColors();

}


class RegisterDataSource extends IRegisterDataSource{

  final _db =FirebaseFirestore.instance;
  
  @override
  Future<List<ModelVehicle>> getModels() async {

    final resp = await _db.collection("models").get();
    List<ModelVehicleModel>  brands = modelVehicleModelFromFirestore(resp.docs);
    return brands;

  }
  
  @override
  Future<List<ColorVehicle>> getColors() async {

    final resp = await _db.collection("colors").get();
    List<ColorVehicleModel>  colors = colorVehicleModelFromFirestore(resp.docs);
    return colors;

  }

}
