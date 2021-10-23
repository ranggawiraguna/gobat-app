import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobat_app/pages/Main.dart';
import 'package:gobat_app/pages/OnBoarding.dart';
import 'package:gobat_app/pages/SplashScreen.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isUserLoggedIn;

  @override
  void initState() {
    AccountSessionManager().isUserLoggedIn().then((value) {
      setState(() => isUserLoggedIn = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        return MaterialApp(
          home: (snapshot.connectionState == ConnectionState.waiting)
              ? SplashScreen()
              : isUserLoggedIn
                  ? Main()
                  : OnBoarding(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
