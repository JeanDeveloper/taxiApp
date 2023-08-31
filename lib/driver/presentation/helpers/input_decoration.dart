import 'package:flutter/material.dart';


InputDecoration inputdecoration()=> InputDecoration(

  isDense: true,

  counterText: '',

  contentPadding: const EdgeInsets.all(15),

  enabledBorder: OutlineInputBorder(


    borderSide: const BorderSide(
      color: Color(0xff26262C),
      width: 2,
    ),

    borderRadius: BorderRadius.circular(10),

  ),

  focusedBorder: OutlineInputBorder(

    borderSide: const BorderSide(

      color: Color(0xff6C63FF),
      width: 2,

    ),
    
    borderRadius: BorderRadius.circular(10),
  ),

  errorBorder: OutlineInputBorder(

    borderSide: const BorderSide(
      color: Colors.red,
      width: 2,
    ),

    borderRadius: BorderRadius.circular(10),

  ),


);