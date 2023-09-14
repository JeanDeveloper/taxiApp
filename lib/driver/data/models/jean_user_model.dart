// To parse this JSON data, do
//     final jeanUserModel = jeanUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi/driver/domain/entities/jean_user.dart';

JeanUserModel jeanUserModelFromJson(String str) => JeanUserModel.fromJson(json.decode(str));

String jeanUserModelToJson(JeanUserModel data) => json.encode(data.toJson());

JeanUserModel jeanUserModelFromFirestore(DocumentSnapshot<Map<String, dynamic>> str) =>JeanUserModel.fromFirestore(str);

class JeanUserModel extends JeanUser {
    @override
  String address;
    @override
  String document;
    @override
  String documentPath;
    @override
  String email;
    @override
  int genderId;
    @override
  bool isActive;
    @override
  String licensePath;
    @override
  String name;
    @override
  String phone;
    @override
  String photoPath;
    @override
  String surname;
    @override
  String uid;
    @override
  int userType;
    @override

  JeanUserModel({
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
  }) : super(address: address, document: document, documentPath: documentPath, email: email, genderId: genderId, isActive: isActive, licensePath: licensePath, name: name, phone: phone, photoPath: photoPath, surname: surname, uid: uid, userType: userType);

  factory JeanUserModel.fromJson(Map<String, dynamic> json) => JeanUserModel(
    address: json["address"],
    document: json["document"],
    documentPath: json["documentPath"],
    email: json["email"],
    genderId: json["genderId"],
    isActive: json["isActive"],
    licensePath: json["licensePath"],
    name: json["name"],
    phone: json["phone"],
    photoPath: json["photoPath"],
    surname: json["surname"],
    uid: json["uid"],
    userType: json["userType"],
    // payout: JeanPayout.fromJson(json["payout"]),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "document": document,
    "documentPath": documentPath,
    "email": email,
    "genderId": genderId,
    "isActive": isActive,
    "licensePath": licensePath,
    "name": name,
    "phone": phone,
    "photoPath": photoPath,
    "surname": surname,
    "uid": uid,
    "userType": userType,
  };


factory JeanUserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>>  document){
  final  modelData = document.data();
  return JeanUserModel(
    address: modelData?["address"],
    document: modelData?["document"],
    documentPath: modelData?["documentPath"],
    email: modelData?["email"],
    genderId: modelData?["genderId"],
    isActive: modelData?["isActive"],
    licensePath: modelData?["licensePath"],
    name: modelData?["name"],
    phone: modelData?["phone"],
    photoPath: modelData?["photoPath"],
    surname: modelData?["surname"],
    uid: modelData?["uid"],
    userType: modelData?["userType"],
  );
}

}




JeanPayoutModel jeanPayoutModelFromFirestore(DocumentSnapshot<Map<String, dynamic>> str) =>JeanPayoutModel.fromFirestore(str);

class JeanPayoutModel extends JeanPayout {
  @override
  String bbva;
  @override
  String bcp;
  @override
  String interbank;
  @override
  String yape;
  @override
  String plin;

  JeanPayoutModel({
      required this.bbva,
      required this.bcp,
      required this.interbank,
      required this.yape,
      required this.plin,
  }) : super(
    bbva: bbva, 
    bcp: bcp, 
    interbank: interbank, 
    yape: yape, 
    plin: plin
  );

  factory JeanPayoutModel.fromJson(Map<String, dynamic> json) => JeanPayoutModel(
      bbva: json["bbva"],
      bcp: json["bcp"],
      interbank: json["interbank"],
      yape: json["yape"],
      plin: json["plin"],
  );

  Map<String, dynamic> toJson() => {
      "bbva": bbva,
      "bcp": bcp,
      "interbank": interbank,
      "yape": yape,
      "plin": plin,
  };


  factory JeanPayoutModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>>  document){
    final  modelData = document.data();
    return JeanPayoutModel(
      bbva: modelData?["bbva"],
      bcp: modelData?["bcp"],
      interbank: modelData?["interbank"],
      plin: modelData?["plin"],
      yape: modelData?["yape"],
    );
  }

}
