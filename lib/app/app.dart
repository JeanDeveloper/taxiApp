import 'package:flutter/material.dart';
import 'package:taxi/app/presentation/screens/carousel/carousel_screen.dart';
// import 'package:taxi/customer/presentation/screens/login/login_screen.dart';

class TaxiApp extends StatelessWidget { 

  const TaxiApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'TaxiApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CarouselScreen(),

    );

  }

}