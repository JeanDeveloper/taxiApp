import 'package:equatable/equatable.dart';

class Payout extends Equatable{
  String yape;
  String plin;
  String bcp;
  String interbank;
  String bbva;

  Payout({
    required this.yape,
    required this.plin,
    required this.bcp,
    required this.interbank,
    required this.bbva,
  });
  
  @override
  List<Object?> get props => [
    yape,
    plin,
    bcp,
    interbank,
    bbva
  ];

}
