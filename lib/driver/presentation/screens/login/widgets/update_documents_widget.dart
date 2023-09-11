import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/widgets/widgets.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class UpdateDocumentWidget extends StatefulWidget {
  const UpdateDocumentWidget({super.key});
  @override
  State<UpdateDocumentWidget> createState() => _UpdateDocumentWidgetState();
}

class _UpdateDocumentWidgetState extends State<UpdateDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:  size.height * .02),
            const Text("Actualiza la foto de perfil", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Tu rostro debe estar reconocible en la imagen cargada", style: TextStyle(color: Colors.grey)),
            SizedBox(height:  size.height * .05),
            const CardImageWidget(),
            SizedBox(height:  size.height * .02),
            const Text("Actualiza los documentos requeridos", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:  size.height * .02),
            const Text("Para verificar su identidad y cumplir con las regulaciones, necesitaremos que cargue los siguientes documentos.", style: TextStyle(color: Colors.grey),textAlign: TextAlign.start),
            SizedBox(height:  size.height * .02),
            const Text("1. Documento Nacional de Identidad.\n 2. Licencia de conducir.\n 3.Tarjeta de Propiedad del vehiculo.", style: TextStyle(color: Colors.grey),textAlign: TextAlign.start),
            SizedBox(height:  size.height * .02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DniDocumentWidget(),
                LicenseDocumentWidget(),
                CardOwnerDocumentWidget(),
              ],
            ),
            SizedBox(height: size.height * .02),
            CustomButtonWidget(
              width: size.width,
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(UploadDocEvent());
              },
              child: const Text("Continuar", style: TextStyle(color: TaxiColors.white)),              
            )
          ],
        ),
      ),
    );

  }
}