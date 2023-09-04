import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/widgets/custom_button.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';

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

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {

              if(state is SendingOTPState){

                return CustomButtonWidget(
                  width: size.width,
                  child: const Center(child: CircularProgressIndicator()),
                );

              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                child: CustomButtonWidget(
                  width: size.width,
                  child: const Text("Enviar Codigo", style: TextStyle(color: TaxiColors.white)),
                  onPressed: () {
                    if( numberController.text.trim() == "" ){
                      return;
                    }else{
                      BlocProvider.of<AuthBloc>(context).add(SendOTPEvent(numberController.text));
                    }
                  },
                ),
              );

            },
          ),
      
        ],
        
      ),
    );
  }
}