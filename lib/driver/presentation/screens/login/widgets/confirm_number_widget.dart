import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/domain/providers/login_provider.dart';
import 'package:taxi/driver/presentation/helpers/input_decoration.dart';

class ConfirmNumberWidget extends StatelessWidget {
  const ConfirmNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);

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

          SizedBox(height: size.height*0.03),

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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        // verificationProvider.codigo = '';
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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }

                      if(value.isEmpty){
                        // verificationProvider.codigo = verificationProvider.codigo.substring(0, verificationProvider.codigo.length-1);
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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }

                      if(value.isEmpty){
                        // verificationProvider.codigo = verificationProvider.codigo.substring(0, verificationProvider.codigo.length-1);

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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        // verificationProvider.codigo = verificationProvider.codigo.substring(0, verificationProvider.codigo.length-1);
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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        // verificationProvider.codigo = verificationProvider.codigo.substring(0, verificationProvider.codigo.length-1);

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
                        // verificationProvider.codigo += value;
                        FocusScope.of(context).nextFocus();
                      }
                      if(value.isEmpty){
                        // verificationProvider.codigo = verificationProvider.codigo.substring(0, verificationProvider.codigo.length-1);

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
                onPressed: ()=> Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  )
                ), 
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
                onPressed: ()=> loginProvider.stepSelected = loginProvider.stepSelected + 1, 
                child: const Text("Continuar", style: TextStyle(color: TaxiColors.white))
              ),



              // ButtonWidget(

              //   padding:EdgeInsets.symmetric(horizontal:size.width * .08, vertical:size.height * .018),
              //   child: const Text('Reenviar codigo', style:  TextStyle(color: Colors.white)),

              //   onpressed: (){

              //     print('se vuelve a enviar el codigo de autenticacion despues de los segundos puestos');
              //     // print(verificationProvider.codigo);
              //   },
                
              // ),

              // ButtonWidget(

              //   padding: EdgeInsets.symmetric(horizontal:size.width * .08, vertical:size.height * .018),
              //   child:  const Text('Verificar', style:  TextStyle(color: Colors.white)),

              //   onpressed: ()async{

              //     // loginProvider.changeState(AuthStatus.Authenticanting);

              //     print('aqui se debe validar si el codigo que se envio es el mismo con el que inserto el usuario por  el teclado');
              //     // print(verificationProvider.codigo);

              //     // PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: loginProvider.verificationId, smsCode: verificationProvider.codigo);

              //     // loginProvider.changeState(AuthStatus.Authenticanting);

              //     await Future.delayed(const Duration(seconds: 4));

              //     // try { 

              //       // final authCredential = await loginProvider.auth.signInWithCredential(phoneAuthCredential);

              //       // if(authCredential.user != null){
              //       //   // loginProvider.changeState(AuthStatus.Authenticated);
              //       // }

              //     // } on FirebaseAuthException catch (e) {

              //     //   loginProvider.changeState(AuthStatus.Unauthenticated);
              //     //   // ignore: use_build_context_synchronously
              //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));

              //     // }
                

              //   },

              // ),

            ],
          
          ),

        ],
        
      ),
    );
  }
}