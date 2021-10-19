import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode
          ? Color(0xFF404040).withOpacity(1.0)
          : Color(0xFF404040).withOpacity(1.0),
      body: Center(
          child: lightMode
              ? Image.asset('assets/SplashScreen.png')
              : Image.asset('assets/SplashScreen.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
