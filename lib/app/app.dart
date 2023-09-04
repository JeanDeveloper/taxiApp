import 'package:flutter/material.dart';
import 'presentation/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taxi/app/presentation/screens/carousel/carousel_screen.dart';
// import 'package:taxi/customer/presentation/screens/login/login_screen.dart';

// class Taxi extends StatelessWidget {
//   const Taxi({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TaxiApp',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: TaxiColors.primaryColor),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

class Taxi extends StatelessWidget {

  const Taxi({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>())
      ], 
      child: const TaxiApp(),
    );

  }

}


class TaxiApp extends StatelessWidget {
  const TaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TaxiColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}