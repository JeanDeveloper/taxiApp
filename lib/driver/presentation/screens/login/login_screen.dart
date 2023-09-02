import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/driver/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class LoginScreenInit extends StatelessWidget {
  const LoginScreenInit({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
      ],
      child: const LoginScreen(),
    );

  }

}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final stepSelected = BlocProvider.of<AuthBloc>(context).stepSelected;
    // print(selected.stepSelected);

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
                  activeStep: stepSelected,
                  onStepReached: (index) => print(index)
                ),
              ),

              BlocBuilder<AuthBloc, AuthState>(
                builder: ( _ , state) {
          
                  if(state is AuthInitial) {
                    return const NumberWidget();
                  }
          
                  // if(state is PhoneVerifying) {
                  //   return Container( width: double.infinity, height: size.height * .95, child:const Center(child: CircularProgressIndicator()));
                  // }
          
                  if(state is PhoneVerified) {
                    return const ConfirmNumberWidget();
                  }
          
                  // if(state is PhoneConfirming) {
                  //   return Container( width: double.infinity, height: size.height * .95, child:const Center(child: CircularProgressIndicator()));
                  // }
          
                  if(state is PhoneConfirmed) {
                    return const ContactDetailWidget();
                  }
          
                  // if(state is AuthLoading) {
                  //   return Container( width: double.infinity, height: size.height * .95, child:const Center(child: CircularProgressIndicator()));
                  // }

                  return SizedBox( width: double.infinity, height: size.height * .95, child:const Center(child: CircularProgressIndicator()));
          
                },
              ),
          
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
