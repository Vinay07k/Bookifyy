import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import './Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookify',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
      home: Builder(
        builder: (BuildContext context) {
          return AnimatedSplashScreen(
            splashIconSize: double.infinity,
            splash: 'assets/splashscreenicon.png',
            nextScreen: HomeScreen(),
            duration: 500,
            backgroundColor: Colors.black,
            splashTransition: SplashTransition.fadeTransition,
          );
        },
      ),
    );
  }
}
