import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';

class CardImageWidget extends StatefulWidget {
  const CardImageWidget ({super.key});

  @override
  State<CardImageWidget> createState() => _CardImageWidgetState();
}

class _CardImageWidgetState extends State<CardImageWidget> {

  String pathImage = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);
    
    return SizedBox(
      width: size.width * .4,
      height: size.height * .2,
      child: Stack(

        children: [
          Container(
            width: size.width * .3,
            height: size.height * .15,
            decoration: BoxDecoration(
              color: Colors.white,
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
            ? Image.asset("assets/png/user-avatar.png") 
            : ClipRRect( borderRadius: BorderRadius.circular(15), child: Image.file(File(pathImage), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 13,
            right: 8,
    
            child: IconButton(
              icon: const Icon(Icons.add_circle_rounded, color: TaxiColors.verylightBlue,),
              iconSize: 40,
              onPressed: (){

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
            ),
    
          )
        ],
    
      ),
    );
  }
}