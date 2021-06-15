import 'package:bookify/Screens/Auth/signup.dart';
import 'package:bookify/Screens/CarouselScreen.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';

import 'package:bookify/Screens/ScreenController.dart';

import 'package:bookify/sizeconfig.dart';

import 'package:bookify/Widgets/buttons.dart';

import 'package:bookify/Widgets/inputfield.dart';

class LoginScreen extends StatelessWidget {
  final routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  CarouselScreen(),
                );
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Log In',
                    style: KTextStyles.kScreenTitle,
                  ),
                  SizedBox(height: getRelativeHeight(0.035)),
                  inputtextField('Email', TextInputType.emailAddress),
                  SizedBox(height: getRelativeHeight(0.025)),
                  inputtextField('Password', TextInputType.visiblePassword,
                      hiddenText: true),
                  SizedBox(height: getRelativeHeight(0.035)),
                  CustomElevatedButton(
                    onPressedFunction: () {
                      Navigator.of(context)
                          .pushNamed(ScreenController.routeName);
                    },
                    child: Text(
                      'Log in',
                      style: KTextStyles.kButtonText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: KTextStyles.kSimpleText,
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(SignUpScreen().routeName),
                        child: Text(
                          'Register!',
                          style: KTextStyles.kSimpleText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
