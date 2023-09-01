import 'package:flutter/material.dart';
import 'package:taxi/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:taxi/app/core/injections/injections.dart' as di;

void main()async{

  await di.init();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const TaxiApp());

}