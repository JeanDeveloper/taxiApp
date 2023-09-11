import 'package:equatable/equatable.dart';

class ModelVehicle extends Equatable{
  String id;
  String description;

  ModelVehicle({
    required this.id,
    required this.description,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, description];

}
