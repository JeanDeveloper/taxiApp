import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/widgets/custom_button.dart';
import 'package:taxi/driver/presentation/screens/screens.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key});

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  late TextEditingController numberController ;

  @override
  void initState() {
    numberController= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {  
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    numberController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      width: size.width,
      height: size.height * .83,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height:(viewBotton == 0) ? size.height * .5 : size.height * .3,
            child: Image.asset("assets/jpg/login_background.jpg", fit:(viewBotton == 0) ? BoxFit.cover : BoxFit.scaleDown),
          ),
          SizedBox(height: size.height * .01),
          const Text(
            "Numero de Telefono", 
            style: TextStyle(
              fontWeight:FontWeight.bold 
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Inicia sesión primero para reservar tu viaje.\n te enviaremos un código a tu teléfono", 
            textAlign: TextAlign.center,
          ),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              maxLength: 9,
              keyboardType: TextInputType.number,
              enableSuggestions: false,
              controller: numberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: TaxiColors.lightGrey,
                counterText: '',
                hintText: 'Numero',
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: TaxiColors.grey
                ),
                errorStyle: const TextStyle(
                  fontSize: 15
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                focusedErrorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: TaxiColors.lightGrey,
                    width: 2.0,
                  ),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: TaxiColors.lightBlue,
                    width: 2.0,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(
                    color: TaxiColors.lightGrey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
    
          TextButton(
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              )
            ), 
            child: const Text(
              "¿Eres Conductor?",
              textAlign: TextAlign.end,
            ),
          ),

          Expanded(
            child: CustomButtonWidget(
              margin: const EdgeInsets.symmetric(horizontal: 20),

              width: size.width ,
              child: const Text("Enviar Codigo", style: TextStyle(color: TaxiColors.white)),
            ),
          ),

        ],
      ),
    );
  }
}