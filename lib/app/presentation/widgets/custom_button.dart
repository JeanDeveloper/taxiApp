import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';

class CustomButtonWidget extends StatelessWidget {

  final Widget child;
  final double width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  // final double? height;
  final void Function()? onPressed ;

  const CustomButtonWidget({
    super.key, 
    this.onPressed, 
    required this.child, 
    required this.width,
    this.margin,
    this.padding
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      padding: padding,
      width: width,
      child: ElevatedButton(
        style: const ButtonStyle(

          backgroundColor: MaterialStatePropertyAll(TaxiColors.purple),

          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10)
              )
            )
          ),
      
        ),
        onPressed: onPressed,
        child: child,
      ),
    );

  }
}