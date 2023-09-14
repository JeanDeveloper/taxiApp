import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/presentation/blocs/location/location_bloc.dart';

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    return SafeArea(
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(20),
        child: IconButton(
          icon: const Icon(Icons.view_headline_rounded, size: 35),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder()),
          ),
          onPressed: (){
            locationBloc.key.currentState!.openDrawer();
          }, 
        ),
      ),
    );
  }

}