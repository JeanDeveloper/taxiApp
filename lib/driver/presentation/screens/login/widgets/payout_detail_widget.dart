import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class PayoutDetailWidget extends StatefulWidget {
  const PayoutDetailWidget({super.key});
  @override
  State<PayoutDetailWidget> createState() => _PayoutDetailWidgetState();
}

class _PayoutDetailWidgetState extends State<PayoutDetailWidget> {
  late TextEditingController yape;
  late TextEditingController plin;
  late TextEditingController bcp;
  late TextEditingController bbva;
  late TextEditingController interbank;

  @override
  void initState() {
    yape      = TextEditingController();
    plin      = TextEditingController();
    bcp       = TextEditingController();
    bbva      = TextEditingController();
    interbank = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      
            SizedBox(height:  size.height * .02),
            const Text("Ingresa la informacion de las modalidades de pago", style: TextStyle(fontWeight: FontWeight.bold)),
      
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Yape",
              controller: yape,
              keyboardType: TextInputType.number,
            ),
      
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Plin",
              controller: plin,
              keyboardType: TextInputType.number,
            ),
      
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Numero de Cuenta BCP",
              controller: bcp,
              keyboardType: TextInputType.number,
            ),
      
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Numero de Cuenta BBVA",
              controller: bbva,
              keyboardType: TextInputType.number,
            ),
      
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Numero de Cuenta Interbank",
              controller: interbank,
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: size.height * .05),
            OutlinedButton(
              style:OutlinedButton.styleFrom(
                backgroundColor: TaxiColors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              onPressed: (){}, 
              child: const Text("Continuar", style: TextStyle(color: TaxiColors.white))
            ),

          ],
        ),
      ),
    );
  }

}