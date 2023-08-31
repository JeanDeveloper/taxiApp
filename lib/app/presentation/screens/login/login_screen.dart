import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
        body: const Center(child: Text("Login Screen"))
    );
  }
}