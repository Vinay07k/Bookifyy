import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bookify/sizeconfig.dart';

import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

import 'package:bookify/Screens/Auth/login.dart';

class SignUpScreen extends StatelessWidget {
  final routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: getRelativeHeight(0.03)),
                  textField('First Name', TextInputType.name),
                  SizedBox(height: getRelativeHeight(0.02)),
                  textField('Email', TextInputType.emailAddress),
                  SizedBox(height: getRelativeHeight(0.02)),
                  textField('Password', TextInputType.visiblePassword,
                      hiddenText: true),
                  SizedBox(height: getRelativeHeight(0.03)),
                  CustomElevatedButton(
                    child: const Text(
                      'Create Account',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                    onPressedFunction: () {
                      Navigator.of(context).pushNamed(LoginScreen().routeName);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Login!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
