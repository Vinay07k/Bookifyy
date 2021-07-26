import 'package:flutter/material.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';

//Providers Import
import 'package:bookify/Providers/Authentication.dart';

//Helper Imports
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';

//Screens Imports
// import 'package:bookify/Screens/Auth/AddProfilePictureScreen.dart';
import 'package:bookify/Screens/Auth/Signup.dart';

//Widgets Imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

class LoginScreen extends StatefulWidget {
  final routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;

  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _onSubmit() async {
    String email = _email.text;
    String password = _password.text;
    String result;

    if (email.isEmpty || password.isEmpty) {
      result = 'Fields can not be empty!';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      result = 'Invalid Email!';
    } else if (password.length < 8) {
      result = 'Password can not be less then 8 characters!';
    } else {
      setState(() {
        _loading = true;
      });
      result = await Auth.signInUser(_email.text, _password.text) ?? '';
    }

    if (result.isNotEmpty) {
      setState(() {
        _loading = false;
      });
      showBottomSnackBar(context: context, text: '$result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).focusColor,
              ),
            )
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Log In',
                        style: KTextStyles.kScreenTitle,
                      ),
                      SizedBox(height: getRelativeHeight(0.035)),
                      inputtextField(
                        label: 'Email',
                        keyboard: TextInputType.emailAddress,
                        controller: _email,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Password',
                        keyboard: TextInputType.visiblePassword,
                        controller: _password,
                        hiddenText: true,
                      ),
                      Spacer(),
                      CustomElevatedButton(
                        onPressedFunction: _onSubmit,
                        child: Text(
                          'Log in',
                          style: KTextStyles.kButtonText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: KTextStyles.kSimpleText,
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName),
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
    );
  }
}
