import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/customer/presentation/screens/login/widgets/number_widget.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              height: size.height * .05,
              child: NumberStepper(
                enableStepTapping: false,
                steppingEnabled: false,
                stepColor: Colors.grey,
                activeStepColor: TaxiColors.primaryColor,
                numbers: const [1,2,3],
                numberStyle: const TextStyle(color: TaxiColors.white, fontSize: 10),
                enableNextPreviousButtons: false,
                activeStep: 0,
                onStepReached: (index) => print(index)
              ),
            ),
            const NumberWidget()       

          ],
        ),
      )
    );
  }
}