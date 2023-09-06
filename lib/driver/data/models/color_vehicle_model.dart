import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';

List<ColorVehicleModel> colorVehicleModelFromJson(String str) => List<ColorVehicleModel>.from(json.decode(str).map((x) => ColorVehicleModel.fromJson(x)));
String colorVehicleModelToJson(List<ColorVehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
List<ColorVehicleModel> colorVehicleModelFromFirestore(List<QueryDocumentSnapshot<Map<String, dynamic>>> str) => str.map((x) => ColorVehicleModel.fromFirestore(x)).toList();


class ColorVehicleModel extends ColorVehicle {
    @override
      String id;
    @override
      String name;

    ColorVehicleModel({
      required this.id,
      required this.name,
    }) : super(id: id, name: name);

    factory ColorVehicleModel.fromJson(Map<String, dynamic> json) => ColorVehicleModel(
        id: json["id"],
        name: json["name"],
    );

    factory ColorVehicleModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>>  document){
      Map modelData = document.data();
      return ColorVehicleModel(
        id: document.id,
        name: modelData["name"]
      );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
