import 'package:bookify/Screens/Home/BookDetailScreen.dart';
import 'package:bookify/Screens/InputMobileNumberScreen.dart';
import 'package:bookify/Screens/SearchScreen.dart';
import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookify/sizeconfig.dart';

import 'package:bookify/Screens/EditScreen.dart';
import 'package:bookify/Screens/InviteContactsScreen.dart';
import 'package:bookify/Screens/Home/ProfileScreen.dart';
import 'package:bookify/Screens/Auth/login.dart';
import 'package:bookify/Screens/Auth/signup.dart';
import 'package:bookify/Screens/ScreenController.dart';
import 'package:bookify/Screens/Home/BlurbDetailScreen.dart';
import 'package:bookify/Screens/CarouselScreen.dart';

void main() => runApp(MyApp());

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
        SearchScreen.routeName: (context) => SearchScreen(),

        //Authentication screens
        SignUpScreen().routeName: (context) => SignUpScreen(),
        LoginScreen().routeName: (context) => LoginScreen(),

        //Blurb screens
        PostScreen().routeName: (context) => PostScreen(),
        ScreenController.routeName: (context) => ScreenController(),
        InviteContactsScreen.routeName: (context) => InviteContactsScreen(),

        //Profile related screen
        ProfileScreen.routeName: (context) => ProfileScreen(),
        EditScreen.routeName: (context) => EditScreen(),

        //Book related screens
        BookDetailScreen.routeName: (context) => BookDetailScreen(),

        //Order related screens
        InputMobileNumberScreen.routeName: (context) =>
            InputMobileNumberScreen(),
      },
    );
  }
}
