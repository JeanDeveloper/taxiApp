import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';

List<ModelVehicleModel> modelVehicleModelFromJson(String str) => List<ModelVehicleModel>.from(json.decode(str).map((x) => ModelVehicleModel.fromJson(x)));
List<ModelVehicleModel> modelVehicleModelFromFirestore(List<QueryDocumentSnapshot<Map<String, dynamic>>> str) => str.map((x) => ModelVehicleModel.fromFirestore(x)).toList();

String modelVehicleModelToJson(List<ModelVehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelVehicleModel extends ModelVehicle{

  @override
  String id;
  @override
  String description;

  ModelVehicleModel({
    required this.id,
    required this.description,
  }) : super(id: id, description: description);

  factory ModelVehicleModel.fromJson(Map<String, dynamic> json) => ModelVehicleModel(
    id: json["id"],
    description: json["description"],
  );

  factory ModelVehicleModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>>  document){
    Map modelData = document.data();
    return ModelVehicleModel(
      id: document.id,
      description: modelData["description"]
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
  };

}
