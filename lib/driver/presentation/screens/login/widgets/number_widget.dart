import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/domain/providers/login_provider.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key});

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {

  late TextEditingController numberController ;

  @override
  void initState() {
    numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          const Text("Ingresa tu numero de telefono", style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("Le enviaremos un código a su número para continuar con el registro"),
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
          SizedBox(height: size.height * .05),

          OutlinedButton(
            style:OutlinedButton.styleFrom(
              backgroundColor: TaxiColors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            onPressed: () => loginProvider.stepSelected = loginProvider.stepSelected + 1, 
            child: const Text("Enviar Codigo", style: TextStyle(color: TaxiColors.white))
          ),
      
        ],
        
      ),
    );
  }
}