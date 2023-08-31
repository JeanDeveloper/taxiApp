import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';

class CustomTextInput extends StatelessWidget{

  final String hinttext;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  // Function(String)? onchanged;
  
  const CustomTextInput({
    super.key, 
    required this.hinttext, 
    required this.keyboardType, 
    // this.onchanged, 
    required this.controller,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: textCapitalization?? TextCapitalization.none,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      autocorrect: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: TaxiColors.lightGrey,
        counterText: '',
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: TaxiColors.grey
        ),

        errorStyle: const TextStyle(
          fontSize: 15
        ),

        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),

        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),

        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: TaxiColors.lightGrey,
            width: 2.0,
          ),
        ),

        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: TaxiColors.lightBlue,
            width: 2.0,
          ),
        ),

        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: TaxiColors.lightGrey,
            width: 1.0,
          ),
        ),
      ),
      // onChanged: onchanged,
    );
  }
}