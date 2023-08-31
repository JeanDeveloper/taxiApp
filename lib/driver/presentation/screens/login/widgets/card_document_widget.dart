import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi/app/core/themes/colors.dart';

class CardDocumentWidget extends StatelessWidget {
  const CardDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      alignment: Alignment.center,
      width: size.width * .3,
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
      child:const FaIcon(FontAwesomeIcons.cloudArrowUp, color: TaxiColors.white, size: 40,),

    );
  }
}