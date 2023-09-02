import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/driver/presentation/helpers/input_decoration.dart';

class ConfirmNumberWidget extends StatefulWidget {
  

  const ConfirmNumberWidget({
    super.key, 
  });

  @override
  State<ConfirmNumberWidget> createState() => _ConfirmNumberWidgetState();
}

class _ConfirmNumberWidgetState extends State<ConfirmNumberWidget> {
  String codeNumber = "";

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          const Text("Codigo de verificacion", style: TextStyle(fontWeight: FontWeight.bold)),
          RichText(
            text:const TextSpan(              
              children: [
                TextSpan(
                  text: "Enviamos un codigo de verificacion a 9*****",
                  style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: "611",
                  style: TextStyle(color: TaxiColors.dark, fontSize: 14, fontWeight: FontWeight.w700),
                )
              ]
            )
          ), 

          //OTP WIDGET
          SizedBox(height: size.height * .03),

          Form(
            
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){

                      if(value.length ==1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        codeNumber = '';
                        FocusScope.of(context).previousFocus();
                      }
                      
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){

                      if(value.length == 1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }

                      if(value.isEmpty){
                        codeNumber = codeNumber.substring(0, codeNumber.length-1);
                        FocusScope.of(context).previousFocus();
                      }

                    },

                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){
                      if(value.length ==1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }

                      if(value.isEmpty){
                        codeNumber = codeNumber.substring(0, codeNumber.length-1);
                        FocusScope.of(context).previousFocus();
                      }

                    },

                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){
                      
                      if(value.length == 1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        codeNumber = codeNumber.substring(0, codeNumber.length-1);
                        FocusScope.of(context).previousFocus();
                      }
                    },

                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){
                      
                      if(value.length == 1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        codeNumber = codeNumber.substring(0, codeNumber.length-1);

                        FocusScope.of(context).previousFocus();
                      }
                    },

                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

                SizedBox(

                  height: 68,
                  width: 46,
                  
                  child: TextFormField(

                    onChanged: (value){
                      
                      if(value.length == 1){
                        codeNumber += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        codeNumber = codeNumber.substring(0, codeNumber.length-1);

                        FocusScope.of(context).previousFocus();
                      }
                    },

                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.headline6,
                    decoration: inputdecoration(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                  ),

                ),

              ],

            )

          ),

          SizedBox(height: size.height*0.03),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              OutlinedButton(
                style:OutlinedButton.styleFrom(
                  backgroundColor: TaxiColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){},
                child: const Text("Reenviar Codigo", style: TextStyle(color: Colors.grey))
              ),

              OutlinedButton(
                style:OutlinedButton.styleFrom(
                  backgroundColor: TaxiColors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  if( codeNumber.trim() == "" ){
                    return;
                  }else{
                    BlocProvider.of<AuthBloc>(context).add(ConfirmVerificationCode(codeNumber));
                  }

                } ,
                child: const Text("Continuar", style: TextStyle(color: TaxiColors.white))
              ),

            ],
          
          ),

        ],
        
      ),
    );
  }
}