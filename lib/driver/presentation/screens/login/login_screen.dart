import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';
import 'package:taxi/driver/presentation/screens/screens.dart';

// class LoginScreenInit extends StatelessWidget {
//   const LoginScreenInit({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider(create: (_) => sl<AuthBloc>()),
//       ],
//       child: const LoginScreen(),
//     );

//   }

// }

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthLoged) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen())
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * .03),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Container(
                      height: size.height * .05,
                      width: size.width * .9,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: NumberStepper(
                        enableStepTapping: false,
                        steppingEnabled: false,
                        stepColor: Colors.grey,
                        activeStepColor: TaxiColors.purple,
                        lineLength: size.width * .005,
                        numbers: const [1, 2, 3, 4, 5, 6],
                        numberStyle: const TextStyle(
                          color: TaxiColors.white, fontSize: 10
                        ),
                        enableNextPreviousButtons: false,
                        activeStep: autBloc.stepSelected,
                      ),
                    );
                  },
                ),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, state) {

                    if (state is AuthUnvalidated) {
                      return const NumberWidget();
                    }

                    if (state is SendedOTPState) {
                      return const ConfirmNumberWidget();
                    }

                    if (state is VerifiedOTPState) {
                      return const ContactDetailWidget();
                    }

                    if (state is SavedContactDetalState) {
                      return const CarDetailWidget();
                    }

                    if (state is SavedDriveDetalState) {
                      return const PayoutDetailWidget();
                    }

                    if (state is SavedPayoutDetalState) {
                      return const UpdateDocumentWidget();
                    }

                    if (state is AuthLoged) {
                      Future.microtask(() =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen())));
                    }

                    return SizedBox(
                      width: double.infinity,
                      height: size.height * .95,
                      child: const Center(child: CircularProgressIndicator())
                    );

                  },
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}
