import 'package:flutter/material.dart';
import 'package:taxi/app/core/themes/colors.dart';


class CardImageWidget extends StatelessWidget {
  const CardImageWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            child: Image.asset("assets/png/user-avatar.png"),
          ),
          Positioned(
            bottom: 13,
            right: 8,
    
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_circle_rounded, color: TaxiColors.verylightBlue,),
              iconSize: 40,
            ),
    
          )
        ],
    
      ),
    );
  }
}