import 'package:taxi/app/domain/entities/iuser.dart';

class Driver extends IUser {

  String uid;
  String? name;
  String? surname;
  String? phone;
  String? document;
  String? address;
  String? email;
  String? documentPath;
  String? photoPath;

  Driver({
    required this.uid,
    this.name,
    this.surname,
    this.phone,
    this.document,
    this.address,
    this.email,
    this.documentPath,
    this.photoPath,
  });
  
}