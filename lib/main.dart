import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobat_app/pages/OnBoarding.dart';
import 'package:gobat_app/pages/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF2F9FC),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        return MaterialApp(
          home: (snapshot.connectionState == ConnectionState.waiting)
              ? SplashScreen()
              : OnBoarding(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
