import 'package:flutter/material.dart';
import 'package:taxi/driver/presentation/blocs/color/color_bloc.dart';
import 'package:taxi/driver/presentation/blocs/register/model_bloc.dart';
import 'presentation/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';

class Taxi extends StatelessWidget  {

  const Taxi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<ModelBloc>()),
        BlocProvider(create: (_) => sl<ColorBloc>()),
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