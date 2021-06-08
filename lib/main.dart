import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bookify/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        accentColor: Colors.white,
        focusColor: Colors.yellow,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Builder(
        builder: (BuildContext context) {
          ScreenSize.intialize(context);
          return AnimatedSplashScreen(
            splashIconSize: double.infinity,
            splash: 'assets/splashscreenicon.png',
            nextScreen: HomeScreen(),
            duration: 500,
            backgroundColor: Theme.of(context).primaryColor,
            splashTransition: SplashTransition.fadeTransition,
          );
        },
      ),
      routes: {
        
      },
    );
  }
}
