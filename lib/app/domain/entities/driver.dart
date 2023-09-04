import 'package:taxi/app/domain/entities/iuser.dart';

class Driver extends IUser {

  String uid;
  String name;

  Driver({
    required this.uid,
    required this.name,
  });
  
}