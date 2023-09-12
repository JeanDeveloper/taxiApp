import 'package:equatable/equatable.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';

class Drive extends Equatable{

  ColorVehicle? color;
  String? documentPath;
  ModelVehicle? model;
  String? plate;
  String? year;
  String? idUser;

  Drive({
    this.color,
    this.documentPath,
    this.model,
    this.plate,
    this.year,
    this.idUser,
  });
  
  @override
  List<Object?> get props => [
    color, documentPath, model, plate, year, idUser
  ];
  
}