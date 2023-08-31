import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/app/core/themes/colors.dart';

class TaxiTheme{

  final borderLight = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: TaxiColors.lightGrey, 
      width: 2, 
      style: BorderStyle.solid
    )
  );

  final borderDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: TaxiColors.grey,
      // width: 2,
      style: BorderStyle.solid
    )
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: TaxiColors.white,
      iconTheme: const IconThemeData(color: TaxiColors.blue),
      titleTextStyle: GoogleFonts.poppins().copyWith(
        color: TaxiColors.blue,
        fontWeight: FontWeight.bold,
      )
    ),
    canvasColor: TaxiColors.white,
    disabledColor: TaxiColors.grey,
    hintColor: TaxiColors.blue,
    dividerColor: TaxiColors.veryLightGrey,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: TaxiColors.blue,
      displayColor: TaxiColors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.zero,
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.grey,
          // width: 2,
          style: BorderStyle.solid
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.grey,
          // width: 2,
          style: BorderStyle.solid
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.grey,
          // width: 2,
          style: BorderStyle.solid
        )
      ),
      labelStyle: const TextStyle(color: TaxiColors.blue, fontSize: 13),
      hintStyle: GoogleFonts.poppins(color: TaxiColors.lightBlue, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: TaxiColors.blue),

  );

  final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: TaxiColors.white,
      iconTheme: const IconThemeData(color: TaxiColors.blue),
      titleTextStyle: GoogleFonts.poppins().copyWith(
        color: TaxiColors.blue,
        fontWeight: FontWeight.bold,
      )
    ),
    canvasColor: TaxiColors.white,
    disabledColor: TaxiColors.grey,
    hintColor: TaxiColors.blue,
    dividerColor: TaxiColors.veryLightGrey,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: TaxiColors.blue,
      displayColor: TaxiColors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.lightGrey, 
          width: 2, 
          style: BorderStyle.solid
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.lightGrey, 
          width: 2, 
          style: BorderStyle.solid
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: TaxiColors.lightGrey, 
          width: 2, 
          style: BorderStyle.solid
        )
      ),
      labelStyle: const TextStyle(color: TaxiColors.blue, fontSize: 13),
      hintStyle: GoogleFonts.poppins(color: TaxiColors.lightBlue, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: TaxiColors.blue),
  );
}