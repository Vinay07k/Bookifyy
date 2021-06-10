import 'package:bookify/Screens/Auth/login.dart';
import 'package:bookify/Screens/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookify/sizeconfig.dart';

import 'package:bookify/Screens/ScreenController.dart';
import 'package:bookify/Screens/PostScreen.dart';
import 'package:bookify/Screens/CarouselScreen.dart';

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
        cardColor: Color.fromRGBO(23, 23, 23, 1),
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
            nextScreen: CarouselScreen(),
            duration: 500,
            backgroundColor: Theme.of(context).primaryColor,
            splashTransition: SplashTransition.fadeTransition,
          );
        },
      ),
      routes: {
        SignUpScreen().routeName: (context) => SignUpScreen(),
        LoginScreen().routeName: (context) => LoginScreen(),
        ScreenController.routeName: (context) => ScreenController(),
        PostScreen().routeName: (context) => PostScreen(),
      },
    );
  }
}
