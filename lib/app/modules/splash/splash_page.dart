import 'package:flutter/material.dart';
import 'package:job_timer/app/extensions/colors_ext.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          context.primaryColorLight,
          context.primaryColor,
        ]),
      ),
      child: Center(child: Image.asset('assets/images/logo.png')),
    ));
  }
}
