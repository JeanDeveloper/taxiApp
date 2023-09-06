import 'package:equatable/equatable.dart';

class ColorVehicle extends Equatable{

    String id;
    String name;

    ColorVehicle({
        required this.id,
        required this.name,
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [id, name];

}
