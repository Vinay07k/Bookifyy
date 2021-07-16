import 'package:bookify/Screens/CarouselScreen.dart';
import 'package:bookify/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bookify/sizeconfig.dart';

import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

import 'package:bookify/Screens/Auth/login.dart';

class SignUpScreen extends StatelessWidget {
  final routeName = '/signup';
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
                    'Create Account',
                    style: KTextStyles.kScreenTitle,
                  ),
                  SizedBox(height: getRelativeHeight(0.03)),
                  inputtextField(
                    label: 'Full Name',
                    keyboard: TextInputType.name,
                  ),
                  SizedBox(height: getRelativeHeight(0.025)),
                  inputtextField(
                    label: 'Username',
                    keyboard: TextInputType.name,
                  ),
                  SizedBox(height: getRelativeHeight(0.025)),
                  inputtextField(
                    label: 'Email',
                    keyboard: TextInputType.emailAddress,
                  ),
                  SizedBox(height: getRelativeHeight(0.025)),
                  inputtextField(
                      label: 'Password',
                      keyboard: TextInputType.visiblePassword,
                      hiddenText: true),
                  SizedBox(height: getRelativeHeight(0.03)),
                  CustomElevatedButton(
                    child: Text(
                      'Create Account',
                      style: KTextStyles.kButtonText,
                    ),
                    onPressedFunction: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: KTextStyles.kSimpleText,
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(LoginScreen().routeName),
                        child: Text(
                          'Login!',
                          style: KTextStyles.kSimpleText,
                        ),
                      )
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
