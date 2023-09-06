// To parse this JSON data, do
//
//     final payoutModel = payoutModelFromJson(jsonString);

import 'dart:convert';

import 'package:taxi/app/domain/entities/payout.dart';

PayoutModel payoutModelFromJson(String str) => PayoutModel.fromJson(json.decode(str));

String payoutModelToJson(PayoutModel data) => json.encode(data.toJson());

class PayoutModel extends Payout{
  String yape;
  String plin;
  String bcp;
  String interbank;
  String bbva;

  PayoutModel({
    required this.yape,
    required this.plin,
    required this.bcp,
    required this.interbank,
    required this.bbva,
  }) : super(
    yape: yape, 
    plin: plin, 
    bcp: bcp, 
    interbank: interbank, 
    bbva: bbva
  );

  factory PayoutModel.fromJson(Map<String, dynamic> json) => PayoutModel(
    yape: json["yape"],
    plin: json["plin"],
    bcp: json["bcp"],
    interbank: json["interbank"],
    bbva: json["bbva"],
  );

  Map<String, dynamic> toJson() => {
    "yape": yape,
    "plin": plin,
    "bcp": bcp,
    "interbank": interbank,
    "bbva": bbva,
  };
}
