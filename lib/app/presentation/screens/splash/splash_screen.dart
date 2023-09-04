import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      // BlocProvider.of<AuthBloc>(context).add(StartValidation());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: TaxiColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.aspectRatio * 250, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/png/logo-suro.png"),
              ),
            ),
            SizedBox(height: size.height * .05),
            Text(
              "Suro Taxi", 
              textAlign: TextAlign.center, 
              style: Theme.of(context).textTheme.headlineMedium!.copyWith( 
                fontWeight: FontWeight.bold, 
                color: TaxiColors.white
              )
            )
          ],
        ),
      ),
    );

    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) {

    //     // if( state is AuthLoged ){
    //     //   final user = state.user;
    //     //   if( user.codTipoUsuario == 1 ){
    //     //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) =>  const HomeScreen()));
    //     //   } if( user.codTipoUsuario == 2 ){
    //     //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) =>  const HomeScreen()));
    //     //   }if( user.codTipoUsuario == 4 ){
    //     //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) =>  const HomeScreenContract()));
    //     //   }
    //     // }

    //     // if( state is AuthUnvalidated ){
    //     //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) => const LoginScreen()));
    //     // }

    //   },
    //   child: Scaffold(
    //     body: Container(
    //       color: TaxiColors.blue,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CircleAvatar(
    //             backgroundColor: Colors.white,
    //             radius: size.aspectRatio * 100, 
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: SvgPicture.asset("assets/svg/logo-smart1.svg"),
    //             ),
    //           ),
    //           SizedBox(height: size.height * .05),
    //           Text(
    //             "Suro", 
    //             textAlign: TextAlign.center, 
    //             style: Theme.of(context).textTheme.headlineMedium!.copyWith( 
    //               fontWeight: FontWeight.bold, 
    //               color: TaxiColors.white
    //             )
    //           )
    //         ],
    //       ),
    //     ),
    //   ),

    // );
  }
}
