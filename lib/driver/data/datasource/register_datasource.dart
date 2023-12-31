import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi/app/domain/entities/drive.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:taxi/app/domain/entities/iuser.dart';
import 'package:taxi/app/domain/entities/payout.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';
import 'package:taxi/driver/data/models/model_vehicle_model.dart';
import 'package:taxi/driver/data/models/color_vehicle_model.dart';

abstract class IRegisterDataSource{

  Future<List<ModelVehicle>> getModels();
  Future<List<ColorVehicle>> getColors();
  Future<void> registerData( IUser user, Drive drive, Payout payout);

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
  
  @override
  Future<void> registerData(IUser usuario, Drive drive, Payout payout) async {

    if(usuario is Driver){
      // Create a new user with a first and last name
      final user = <String, dynamic>{
        "address": usuario.address,
        "document": usuario.document,
        "documentPath": "data:image/jpeg;base64,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",
        "email": usuario.email,
        "isActive": true,
        "licensePath": "https://img.freepik.com/vector-gratis/plantilla-licencia-conducir-diseno-plano_23-2149944210.jpg?w=2000",
        "name": usuario.name,
        "phone": usuario.phone,
        "photoPath": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        "surname": usuario.surname,
        "uid": usuario.uid,
        "userType": 1,
        "genderId": usuario.gender!.code,
      };

      final pay = <String, dynamic>{
        "bbva": payout.bbva,
        "bcp": payout.bcp,
        "interbank": payout.interbank,
        "plin": payout.plin,
        "yape": payout.yape
      };

      final driv = <String, dynamic>{
        "idColor": drive.color!.id,
        "documentPath": "drive",
        "idModel": drive.model!.id,
        "plate": drive.plate,
        "uidUser": usuario.uid,
        "year": drive.year,
      };

      final userRef = await _db.collection("users").add(user);

      final payoutRef = await _db.collection("users").doc(userRef.id).collection("payout").add(pay);

      final driveRef = await _db.collection("drivers").add(driv);

      print(userRef.id);
      print(payoutRef.id);
      print(driveRef.id);

    }


  }

}


