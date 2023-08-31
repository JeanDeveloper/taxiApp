import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/domain/providers/login_provider.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const LoginScreenBeta(),
    );

  }
}

class LoginScreenBeta extends StatelessWidget {
  const LoginScreenBeta({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
        
              SizedBox(
                width: double.infinity,
                height: size.height * .05,
                child: NumberStepper(
                  enableStepTapping: false,
                  steppingEnabled: false,
                  stepColor: Colors.grey,
                  activeStepColor: TaxiColors.purple,
                  lineLength: size.width * .05,
                  numbers: const [1, 2, 3, 4, 5, 6],
                  numberStyle: const TextStyle(color: TaxiColors.white, fontSize: 10),
                  enableNextPreviousButtons: false,
                  activeStep: loginProvider.stepSelected,
                  onStepReached: (index) => print(index)
                ),
              ),

              const SelectedWidget(),

              // const NumberWidget()
              // const ConfirmNumberWidget()
              // const ContactDetailWidget(),
              // const CarDetailWidget(),
              // const PayoutDetailWidget(),
              // const UpdateDocumentWidget(),
            
            ],
          ),
        ),
      )
    );  
  }
}


class SelectedWidget extends StatelessWidget {

  const SelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ingresoProvider = Provider.of<LoginProvider>(context);

    switch (ingresoProvider.stepSelected) {
      case 0:
        return const NumberWidget();

      case 1:
        return const ConfirmNumberWidget();

      case 2:
        return const ContactDetailWidget();

      case 3:
        return const CarDetailWidget();

      case 4:
        return const PayoutDetailWidget();

      case 5:
        return const UpdateDocumentWidget();

      default:
        return const NumberWidget();

    }

  }
}