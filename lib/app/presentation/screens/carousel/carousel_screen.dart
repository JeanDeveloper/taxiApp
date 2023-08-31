import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:taxi/customer/presentation/screens/screens.dart';
class CarouselScreen extends StatelessWidget {

  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        onDone: () {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )
          );
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        safeAreaList: const [true, true, true, true],
        skip: const Text("Saltar", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.forward),
        done: const Text("Hecho", style: TextStyle(fontWeight: FontWeight.w600),),
        dotsDecorator: getDotsDecorator(),

        pages: [
          PageViewModel(
            title: "¡Bienvenido a Taxi App!",
            body: "Servicio de taxi diseñado para tu comodidad tenga viajes con sus conductores favoritos y elija sus preferencias de viaje",
            image: buildSvg("assets/svg/order.svg"),
            decoration: getPageDecoration()
          ),
          PageViewModel(
            title: "¡Muchas recompensas para ti!",
            body: "Obten bonos extras por recomendar a un amigo, completar viajes y mucho mas",
            image: buildSvg("assets/svg/gif.svg"),
            decoration: getPageDecoration()
          ),
          PageViewModel(
            title: "Iniciar Sesión",
            body: "A un segundo de iniciar sesión y comenzar un viaje comodo",
            image: buildSvg("assets/svg/fingerprint.svg"),
            decoration: getPageDecoration()
          ), 
        ],

      )

    );
  }

  DotsDecorator getDotsDecorator(){
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  Widget buildSvg(String imagePath) {
    return SvgPicture.asset(
      imagePath,
    );
  }

}
