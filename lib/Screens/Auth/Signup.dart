import 'package:bookify/Providers/Authentication.dart';
import 'package:bookify/Screens/Auth/Inputdetail.dart';
import 'package:bookify/Widgets/Scaffold/bottom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Helper Imports
import 'package:bookify/constants.dart';
import 'package:bookify/sizeconfig.dart';

//Widgets Imports
import 'package:bookify/Widgets/buttons.dart';
import 'package:bookify/Widgets/inputfield.dart';

//Screens Imports
import 'package:bookify/Screens/Auth/Login.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = '/signup';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loading = false;

  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmpassword;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
  }

  void onSubmit() async {
    final String email = _email.text;
    final String password = _password.text;
    final String confirmPassword = _confirmpassword.text;
    late String result;

    //For email validation
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email) ||
        email.isEmpty) {
      result = 'Invalid Email';
      //
      //Passwords Validation
      //
    } else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(' ')) {
      //
      result =
          'Password should be greater then 8 characters and should not have spaces!';
      //
    } else if (password != confirmPassword) {
      result = 'Passwords does not match!';
    } else {
      setState(() {
        _loading = true;
      });
      result = await Auth.singUpUser(email, password) ?? '';
    }

    if (result.isNotEmpty) {
      setState(() {
        _loading = false;
      });
      showBottomSnackBar(context: context, text: '$result');
    }
  }

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
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
                        'Create Account',
                        style: KTextStyles.kScreenTitle,
                      ),
                      SizedBox(height: getRelativeHeight(0.03)),
                      inputtextField(
                        label: 'Email',
                        controller: _email,
                        keyboard: TextInputType.emailAddress,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Password',
                        controller: _password,
                        keyboard: TextInputType.visiblePassword,
                        hiddenText: true,
                      ),
                      SizedBox(height: getRelativeHeight(0.025)),
                      inputtextField(
                        label: 'Confirm Password',
                        controller: _confirmpassword,
                        keyboard: TextInputType.visiblePassword,
                        hiddenText: true,
                      ),
                      Spacer(),
                      CustomElevatedButton(
                          child: Text(
                            'Next >>',
                            style: KTextStyles.kButtonText,
                          ),
                          onPressedFunction: () => onSubmit()
                          // Navigator.of(context).pushNamed(InputDetail.routeName),
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
    );
  }
}
