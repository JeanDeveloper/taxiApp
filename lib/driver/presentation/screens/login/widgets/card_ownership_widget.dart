import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';

class CardOwnerDocumentWidget extends StatefulWidget {
  const CardOwnerDocumentWidget({super.key});

  @override
  State<CardOwnerDocumentWidget> createState() => _CardOwnerDocumentWidgetState();
}

class _CardOwnerDocumentWidgetState extends State<CardOwnerDocumentWidget> {
  String pathImage = "";
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {

            
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: size.width ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Elige una modalidad',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () async { 

                          final ImagePicker picker = ImagePicker();
                          final XFile? photo = await picker.pickImage(source: ImageSource.camera);

                          if( photo != null){
                            setState(() {
                              pathImage  = photo.path;
                              authBloc.photoProfile = photo;

                              Navigator.of(context).pop();
                            });
                          }

                        },
                        child: const Text("Camara"),
                      ),                        
                      TextButton(
                        onPressed: () async {  

                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                          if( image != null){
                            setState(() {
                              pathImage  = image.path;
                              authBloc.photoProfile = image;
                              Navigator.of(context).pop();
                            });
                          }

                        },
                        child: const Text("Galeria"),
                      ),   
                    ],
                  ),
                );
              }
            );







            
          },
          child: Container(
            alignment: Alignment.center,
            width: size.width * .23,
            height: size.height * .15,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,0),
                  blurRadius: 5,
                )
              ]
            ),
            child: (pathImage == "") 
              ? const FaIcon(
                FontAwesomeIcons.cloudArrowUp, 
                color: TaxiColors.white, 
                size: 40
              )
              : ClipRRect( borderRadius: BorderRadius.circular(15), child: Image.file(File(pathImage), fit: BoxFit.cover)),

            
          ),
        ),
        SizedBox(  width: size.width * 0.2, child: const Text("Tarjeta de Propiedad", style: TextStyle(color: Colors.grey),textAlign: TextAlign.center, maxLines: 2))
      ],
    );
  }
}