import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';

class ButtonWidget extends StatelessWidget {
  
  final EdgeInsetsGeometry padding;

  final Function()? onpressed;

  final Widget child;
  

  const ButtonWidget({
    Key? key, 
    required this.padding, 
    this.onpressed, 
    required this.child
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return TextButton(

      style: ButtonStyle(

        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline6!.copyWith(
            fontSize: 14,
          )
        ),

        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        backgroundColor: MaterialStateProperty.all(TaxiColors.purple)
      ),

      onPressed: onpressed,

      child:child,

    );

    
  }
}