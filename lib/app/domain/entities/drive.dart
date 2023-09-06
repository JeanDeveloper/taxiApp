import 'package:equatable/equatable.dart';

class Drive extends Equatable{

  String? idColor;
  String? documentPath;
  String? idModel;
  String? plate;
  String? year;
  String? idUser;

  Drive({
    this.idColor,
    this.documentPath,
    this.idModel,
    this.plate,
    this.year,
    this.idUser,
  });
  
  @override
  List<Object?> get props => [
    idColor, documentPath, idModel, plate, year, idUser
  ];
  
}