import 'package:flutter/material.dart';

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: (){}, 
        ),
      ),
    );
  }
}