import 'package:equatable/equatable.dart';

class JeanUser  extends Equatable{
  String address;
  String document;
  String documentPath;
  String email;
  int genderId;
  bool isActive;
  String licensePath;
  String name;
  String phone;
  String photoPath;
  String surname;
  String uid;
  int userType;
  JeanPayout? payout;

  JeanUser({
    required this.address,
    required this.document,
    required this.documentPath,
    required this.email,
    required this.genderId,
    required this.isActive,
    required this.licensePath,
    required this.name,
    required this.phone,
    required this.photoPath,
    required this.surname,
    required this.uid,
    required this.userType,
    this.payout,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props =>[
    address,
    document,
    documentPath,
    email,
    genderId,
    isActive,
    licensePath,
    name,
    phone,
    photoPath,
    surname,
    uid,
    userType,
    payout,
  ];
}

class JeanPayout extends Equatable{
  String bbva;
  String bcp;
  String interbank;
  String yape;
  String plin;

  JeanPayout({
    required this.bbva,
    required this.bcp,
    required this.interbank,
    required this.yape,
    required this.plin,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    bbva,
    bcp,
    interbank,
    yape,
    plin,
  ];

}
