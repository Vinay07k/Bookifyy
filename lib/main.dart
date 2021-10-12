import 'package:bookify/Providers/BlurbProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Packages Imports
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//Firebase Imports
import 'package:firebase_core/firebase_core.dart';

//Helpers Imports
import 'package:bookify/sizeconfig.dart';

//Screens Imports
import 'package:bookify/Screens/Auth/AddProfilePictureScreen.dart';
import 'package:bookify/Screens/Auth/Login.dart';
import 'package:bookify/Screens/Auth/Signup.dart';
import 'package:bookify/Screens/Home/ProfileScreen.dart';
import 'package:bookify/Screens/Home/BookDetailScreen.dart';
import 'package:bookify/Screens/Home/BlurbDetailScreen.dart';
import 'package:bookify/Screens/AboutUs.dart';
import 'package:bookify/Screens/Auth/Inputdetail.dart';
import 'package:bookify/Screens/CreateBlurbScreen.dart';
import 'package:bookify/Screens/InputMobileNumberScreen.dart';
import 'package:bookify/Screens/SearchScreen.dart';
import 'package:bookify/Screens/EditProfileScreen.dart';
import 'package:bookify/Screens/InviteContactsScreen.dart';
import 'package:bookify/Screens/ScreenController.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return Center(
            child: CircularProgressIndicator(),
          );
        return ChangeNotifierProvider<BlurbProvider>(
          create: (context) => BlurbProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bookify',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
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
                  nextScreen: StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder:
                        (BuildContext context, AsyncSnapshot<User?> snapshot) {
                      //Loginscreen if no logged in User found
                      if (snapshot.data == null) return LoginScreen();

                      //Homescreen if logged in User found
                      return ScreenController();
                    },
                  ),
                  duration: 500,
                  backgroundColor: Theme.of(context).primaryColor,
                  splashTransition: SplashTransition.fadeTransition,
                );
              },
            ),
            routes: {
              SearchScreen.routeName: (context) => SearchScreen(),

              //Authentication screens
              SignUpScreen.routeName: (context) => SignUpScreen(),
              LoginScreen().routeName: (context) => LoginScreen(),
              AddProfilePictureScreen.routeName: (context) =>
                  AddProfilePictureScreen(),
              InputDetail.routeName: (context) => InputDetail(),

              //Blurb screens
              BlurbScreen().routeName: (context) => BlurbScreen(),
              ScreenController.routeName: (context) => ScreenController(),
              AboutUs.routeName: (context) => AboutUs(),
              InviteContactsScreen.routeName: (context) =>
                  InviteContactsScreen(),
              CreateBlurbScreen.routeName: (context) => CreateBlurbScreen(),

              //Profile related screen
              ProfileScreen.routeName: (context) => ProfileScreen(),
              EditScreen.routeName: (context) => EditScreen(),

              //Book related screens
              BookDetailScreen.routeName: (context) => BookDetailScreen(),

              //Order related screens
              InputMobileNumberScreen.routeName: (context) =>
                  InputMobileNumberScreen(),
            },
          ),
        );
      },
    );
  }
}
