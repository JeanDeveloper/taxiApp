import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/presentation/screens/screens.dart';
import 'package:taxi/app/presentation/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const ContainerImage(),
            const Positioned(
              top: 50,
              left: 5,
              child: BackButton(
                color:TaxiColors.dark
              ),
            ),
            Positioned( 
              bottom: size.height * .25, 
              left: size.width * .4, 
              child: const Text("¡Bienvenido!", style: TextStyle(fontWeight: FontWeight.bold))
            ),
            Positioned(
              bottom: size.height * .15,
              child: CustomButtonWidget(
                padding: EdgeInsets.symmetric(horizontal: size.aspectRatio * 50),
                width: size.width,
                child: const Text("Iniciar Sesion", style: TextStyle(color: TaxiColors.white)),
                onPressed:() => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen()
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .7,
      decoration: const BoxDecoration(
        color: TaxiColors.verylightBlue,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
      ),
      child: SvgPicture.asset(
        "assets/svg/login-driver.svg",
      ),
    );
  }
}